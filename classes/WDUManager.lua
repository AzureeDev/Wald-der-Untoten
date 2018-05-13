WDUManager = WDUManager or class()

function WDUManager:init()
    if not self:_on_wdu_map() then
        return
    end

    self:_init_variables()
    self:_setup_xaudio()
end

function WDUManager:_init_variables()
    self.wave_highscore_file = SavePath .. "WaldDerUntoten_Highscore.data"
    self.xaudio_initialized = false
    self.players = {
        [1] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            synched = false
        },
        [2] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            synched = false
        },
        [3] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            synched = false
        },
        [4] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0,
            synched = false
        }
    }
    self.level = {
        zombies = {
            currently_spawned = 0,
            max_spawns = 8,
            killed = 0,
            add_on_end_wave = 6
        },
        wave = {
            current = 0
        },
        active_events = {
            double_points = false,
            instakill = false,
            firesale = false
        }
    }

    self.points = {
        default = 50,
        on_kill = {
            shield = 80,
            spooc = 120,
            tank = 150,
            tank_green = 160,
            tank_black = 175,
            tank_skull = 190,
            tank_hw = 200,
            taser = 100,
            medic = 80,
            sniper = 95
        },
        on_hit = 10,
        on_headshot = 50,
        on_melee_kill = 130
    }
end

function WDUManager:_init_new_player(data)
    if not data then
        return
    end

    self:_set_player_name(data.id, data.name)
    self:_set_start_money(data.id, 500)
end

function WDUManager:_init_wave_highscore()
    local function SaveFirstTime()
        if file.DirectoryExists( SavePath ) then	
            local file = io.open( self.wave_highscore_file , "w+")
            if file then
                file:write("0")
                file:close()
            end
        end
    end

    local file = io.open( self.wave_highscore_file , "r")
	if file then
		self.players[self:_peer_id()].max_waves_survived = tonumber(file:read("*all"))
        file:close()
    else
        SaveFirstTime()
        self.players[self:_peer_id()].max_waves_survived = 0
    end
    
    LuaNetworking:SendToPeers( "ZMWavesHighScore", tostring(self.players[self:_peer_id()].max_waves_survived) )
end

function WDUManager:_save_new_highscore(wave)
    if file.DirectoryExists( SavePath ) then	
        local file = io.open( self.wave_highscore_file , "w+")
        if file then
            file:write(tostring(wave))
            file:close()
        end
    end

    self.players[self:_peer_id()].max_waves_survived = wave
    LuaNetworking:SendToPeers("ZMWavesHighScore", tostring(wave))
end

function WDUManager:_get_current_highscore_of(id)
    return self.players[id].max_waves_survived
end

function WDUManager:_set_player_name(id, name)
    self.players[id].player_name = name
end

function WDUManager:_set_start_money(id, money)
    self.players[id].money = money
    self.players[id].total_score = money
end

function WDUManager:_peer_id()
    return Global.game_settings.single_player and 1 or managers.network:session() and managers.network:session():local_peer():id() or 1
end

function WDUManager:_multiply_zombies_by_wave(current_wave)
    self.level.zombies.max_spawns = self.level.zombies.max_spawns + (self.level.zombies.add_on_end_wave + current_wave)
end

function WDUManager:_get_own_money()
    local my_id = self:_peer_id()
    return self.players[my_id].money
end

function WDUManager:_add_money_to(peer_id, amount)
    if amount and type(amount) == "number" then
        local additional_amount = math.floor(amount)
        self.players[peer_id].money = self.players[peer_id].money + additional_amount
        self.players[peer_id].total_score = self.players[peer_id].total_score + additional_amount

        LuaNetworking:SendToPeers( "ZMUpdatePoints", tostring(self:_get_own_money()) )
        self:_update_hud_element()
    end
end

function WDUManager:_deduct_money_to(peer_id, amount)
    if amount and type(amount) == "number" then
        local minus_amount = math.floor(amount)
        self.players[peer_id].money = self.players[peer_id].money - minus_amount

        LuaNetworking:SendToPeers( "ZMUpdatePoints", tostring(self:_get_own_money()) )
        self:_update_hud_element()
    end
end

function WDUManager:_update_hud_element()
    if not Global.game_settings.single_player then
        for _, peer in pairs(managers.network:session():all_peers()) do
            Steam:friend_avatar(2, peer:user_id(), function (texture)
        		local avatar = texture or "guis/textures/pd2/none_icon"
                managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_image(avatar)
        		managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_visible(true)
        	end)
            managers.hud._hud_zm_points._zmp_points[peer:id()]:set_text(tostring(self.players[peer:id()].money))
            managers.hud._hud_zm_points:_animate_points_gained(managers.hud._hud_zm_points._zmp_points[peer:id()])
            managers.hud._hud_zm_points._zmp_points[peer:id()]:set_visible(true)
        end
    else
        Steam:friend_avatar(2, Steam:userid(), function (texture)
            local avatar = texture or "guis/textures/pd2/none_icon"
            managers.hud._hud_zm_points._zmp_avatars[1]:set_image(avatar)
            managers.hud._hud_zm_points._zmp_avatars[1]:set_visible(true)
        end)
        managers.hud._hud_zm_points._zmp_points[1]:set_text(tostring(self.players[1].money))
        managers.hud._hud_zm_points:_animate_points_gained(managers.hud._hud_zm_points._zmp_points[1])
        managers.hud._hud_zm_points._zmp_points[1]:set_visible(true)
    end
end

function WDUManager:_update_total_score(peer_id, add)
    if not peer_id then
        return
    end

    self.players[peer_id].total_score = self.players[peer_id].total_score + add
end

function WDUManager:_get_points_amount(category, unit)
    if not unit then
        return self.points[category]
    end

    if not self.points[category][unit] then
        return self.points["default"]
    end

    return self.points[category][unit]
end

function WDUManager:_on_wdu_map()
    if Global.editor_mode then
        return true
    end

    if not managers.job then
        return false
    end
    
    if managers.job:current_level_id() == "zm_the_forest" then
        return true
    end

    return false
end

function WDUManager:_setup_event_state(event, state)
    self.level.active_events[event] = state
end

function WDUManager:_is_event_active(event)
    return self.level.active_events[event]
end

function WDUManager:_get_current_wave()
    return self.level.wave.current
end

function WDUManager:_setup_xaudio()
    blt.xaudio.setup()
    self.xaudio_initialized = true
end

function WDUManager:_play_music(event)
    if not self.xaudio_initialized then
        return
    end

    Global.music_manager.source:post_event("stop_all_music")

    if self._music_source then
        self._buffer:close(true)
        self._music_source:close()
        self._music_source = nil
    end

    self._buffer = XAudio.Buffer:new(self:_get_mod_path() .. "assets/sound/" .. event .. ".ogg")
    self._music_source = XAudio.Source:new(self._buffer)
    self._music_source:set_type("music")
    self._music_source:set_relative(true)
end

function WDUManager:_get_mod_path()
    return WDU.ModPath
end

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_WDUManager_Sync", function(sender, id, data)
    if id == "ZMUpdatePoints" then
        local points = tonumber(data)

        managers.wdu.players[sender].money = points

        managers.wdu:_update_hud_element()
        managers.wdu:_update_total_score(sender, points)
    end

    if id == "ZMWavesHighScore" then
        local max_waves = tonumber(data)
        managers.wdu.players[sender].max_waves_survived = max_waves
    end
end)