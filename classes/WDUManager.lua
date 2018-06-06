WDUManager = WDUManager or class()

function WDUManager:init()
    if not self:_on_wdu_map() then
        return
    end

    self:_init_variables()
    self:_setup_xaudio()
    self:_setup_video_panel()
    
    if LocalizationManager then
        LocalizationManager:load_localization_file( self:_get_mod_path() .. "loc/unique_lines.txt" )
    end
end

function WDUManager:_init_variables()
    self.wave_highscore_file = SavePath .. "WaldDerUntoten_Highscore.data"
    self.xaudio_initialized = false
    self.players = {
        [1] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0
        },
        [2] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0
        },
        [3] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0
        },
        [4] = {
            player_name = "",
            total_score = 500,
            money = 500,
            max_waves_survived = 0
        }
    }
    self.level = {
        zombies = {
            currently_spawned = 0,
            max_spawns = 8,
            killed = 0,
            add_on_end_wave = 2
        },
        wave = {
            current = 0,
            delay_timeout = 10,
            is_special_wave = false
        },
        active_events = {
            double_points = false,
            instakill = false,
            firesale = false
        },
        teleporter = {
            active = true
        },
        scale = 0,
        scale_value_max = 0
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

    self._sound_buffers = {}
    self._sound_sources = {}
end

function WDUManager:_init_new_player(data)
    if not data then
        return
    end

    self:_set_player_name(data.id, data.name)
    self:_set_start_money(data.id, 500)
end

function WDUManager:_number_of_players()
    return managers.network:session() and managers.network:session():amount_of_players() or 1
end

function WDUManager:_is_solo()

    if Global.game_settings.single_player then
        return true
    end

    local nb_players = managers.network:session() and managers.network:session():amount_of_players()
    
    if nb_players == 1 then
        return true
    end

    return false
end

function WDUManager:_increase_scale_value()
    self.level.scale = self.level.scale + 1
end

function WDUManager:_get_scale()
    return self.level.scale
end

function WDUManager:_scale_required()
    if self.level.scale >= self.level.scale_value_max then
        return true
    end

    return false
end

function WDUManager:_reset_scale()
    self.level.scale = 0
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
    if self:_is_solo() then
        self.level.zombies.max_spawns = self.level.zombies.max_spawns + current_wave
        return
    end

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
                managers.hud._hud_zm_points._zmp_points[peer:id()]:set_visible(true)
        end
    else
        Steam:friend_avatar(2, Steam:userid(), function (texture)
            local avatar = texture or "guis/textures/pd2/none_icon"
            managers.hud._hud_zm_points._zmp_avatars[1]:set_image(avatar)
            managers.hud._hud_zm_points._zmp_avatars[1]:set_visible(true)
        end)
        managers.hud._hud_zm_points._zmp_points[1]:set_text(tostring(self.players[1].money))
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

function WDUManager:_element_play_sound(data)
    if not self.xaudio_initialized then
        return
    end

    if not self._sound_sources[data.name] then
        table.insert(self._sound_buffers, data.name)
        table.insert(self._sound_sources, data.name)
    end

    if self._sound_sources[data.name] then
        self._sound_buffers[data.name]:close(true)
        self._sound_sources[data.name]:close()
        self._sound_sources[data.name] = nil
    end

    local directory = ""

    if data.custom_dir and data.custom_dir ~= "" then
        directory = data.custom_dir .. "/"
    end

    self._sound_buffers[data.name] = XAudio.Buffer:new(self:_get_mod_path() .. "assets/" .. directory .. data.file_name)
    self._sound_sources[data.name] = XAudio.Source:new(self._sound_buffers[data.name])

    if not data.sound_type then
        data.sound_type = "sfx"
    end

    self._sound_sources[data.name]:set_type(data.sound_type)
    self._sound_sources[data.name]:set_relative(data.is_relative)
    self._sound_sources[data.name]:set_looping(data.is_loop)

    if data.is_3d then
        self._sound_sources[data.name]:set_position(data.position)
    end

    if data.use_velocity then
        self._sound_sources[data.name]:set_velocity(data.position)
    end

    if data.override_volume and data.override_volume > 0 then
        if data.override_volume > 1 then
            data.override_volume = 1
        end

        self._sound_sources[data.name]:set_volume(data.override_volume)
    end
end

function WDUManager:_play_music(event)
    if not self.xaudio_initialized then
        return
    end

    if not XAudio then
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

function WDUManager:_setup_video_panel()
    self._full_workspace = managers.gui_data:create_fullscreen_workspace()
end

function WDUManager:_play_teleporter_transition()

    local res = RenderSettings.resolution
	local src_width = 1280
	local src_height = 720
	local dest_width, dest_height = nil

	if res.x / res.y < src_width / src_height then
		dest_width = res.x
		dest_height = (src_height * dest_width) / src_width
	else
		dest_height = res.y
		dest_width = (src_width * dest_height) / src_height
    end
    
    local x = (res.x - dest_width) / 2
    local y = (res.y - dest_height) / 2
    
    self.video_panel = managers.wdu._full_workspace:panel():video({
		video = "movies/ascension",
		x = x,
		y = y,
		layer = -10
	})
end

function WDUManager:_set_teleporter_state(state)
    self.level.teleporter.active = state
end

function WDUManager:_is_teleporter_available()
    return self.level.teleporter.active
end

function WDUManager:_is_special_wave()
    return self.level.wave.is_special_wave
end

function WDUManager:_set_special_wave(state)
    self.level.wave.is_special_wave = state
end

function WDUManager:_get_weapons_in_mystery_box()
    return {
        "wpn_fps_spe_wunderwaffe",
		"wpn_fps_special_roach",
		"wpn_fps_ass_m14",
		"wpn_fps_shot_b682",
		"wpn_fps_smg_mp9",
		"wpn_fps_snp_m95",
		"wpn_fps_ass_fal",
		"wpn_fps_pis_deagle",
		"wpn_fps_ass_aug",
		"wpn_fps_smg_p90",
		"wpn_fps_sho_striker",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_ass_scar",
		"wpn_fps_pis_judge",
		"wpn_fps_smg_thompson",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_pis_rage",
		"wpn_fps_snp_msr",
		"wpn_fps_ass_flint",
		"wpn_fps_pis_breech",
		"wpn_fps_spe_rpg7",
		"wpn_fps_smg_tec9"
    }
end

function WDUManager:_convert_factory_to_upgrade()
    return {
		wpn_fps_spe_wunderwaffe_primary = "wpn_fps_spe_wunderwaffe_dg3_primary",
		wpn_fps_spe_wunderwaffe_secondary = "wpn_fps_spe_wunderwaffe_dg3_secondary",
		wpn_fps_ass_m14_primary = "wpn_fps_ass_m14_upg_primary",
		wpn_fps_ass_m14_secondary = "wpn_fps_ass_m14_upg_secondary",
		wpn_fps_snp_m95_primary = "wpn_fps_snp_m95_upg_primary",
		wpn_fps_snp_m95_secondary = "wpn_fps_snp_m95_upg_secondary",
		wpn_fps_smg_mp9_primary = "wpn_fps_smg_mp9_upg_primary",
		wpn_fps_smg_mp9_secondary = "wpn_fps_smg_mp9_upg_secondary",
		wpn_fps_shot_b682_primary = "wpn_fps_shot_b682_upg_primary",
		wpn_fps_shot_b682_secondary = "wpn_fps_shot_b682_upg_secondary",
		wpn_fps_pis_1911_primary = "wpn_fps_pis_1911_upg_primary",
		wpn_fps_pis_1911_secondary = "wpn_fps_pis_1911_upg_secondary",
		wpn_fps_ass_fal_primary = "wpn_fps_ass_fal_upg_primary",
		wpn_fps_ass_fal_secondary = "wpn_fps_ass_fal_upg_secondary",
		wpn_fps_pis_deagle_primary = "wpn_fps_pis_deagle_upg_primary",
		wpn_fps_pis_deagle_secondary = "wpn_fps_pis_deagle_upg_secondary",
		wpn_fps_ass_aug_primary = "wpn_fps_ass_aug_upg_primary",
		wpn_fps_ass_aug_secondary = "wpn_fps_ass_aug_upg_secondary",
		wpn_fps_smg_p90_primary = "wpn_fps_smg_p90_upg_primary",
		wpn_fps_smg_p90_secondary = "wpn_fps_smg_p90_upg_secondary",
		wpn_fps_sho_striker_primary = "wpn_fps_sho_striker_upg_primary",
		wpn_fps_sho_striker_secondary = "wpn_fps_sho_striker_upg_secondary",
		wpn_fps_ass_amcar_primary = "wpn_fps_ass_amcar_upg_primary",
		wpn_fps_ass_amcar_secondary = "wpn_fps_ass_amcar_upg_secondary",
		wpn_fps_ass_m16_primary = "wpn_fps_ass_m16_upg_primary",
		wpn_fps_ass_m16_secondary = "wpn_fps_ass_m16_upg_secondary",
		wpn_fps_ass_scar_primary = "wpn_fps_ass_scar_upg_primary",
		wpn_fps_ass_scar_secondary = "wpn_fps_ass_scar_upg_secondary",
		wpn_fps_pis_judge_primary = "wpn_fps_pis_judge_upg_primary",
		wpn_fps_pis_judge_secondary = "wpn_fps_pis_judge_upg_secondary",
		wpn_fps_smg_thompson_primary = "wpn_fps_smg_thompson_upg_primary",
		wpn_fps_smg_thompson_secondary = "wpn_fps_smg_thompson_upg_secondary",
		wpn_fps_lmg_hk21_primary = "wpn_fps_lmg_hk21_upg_primary",
		wpn_fps_lmg_hk21_secondary = "wpn_fps_lmg_hk21_upg_secondary",
		wpn_fps_lmg_m249_primary = "wpn_fps_lmg_m249_upg_primary",
		wpn_fps_lmg_m249_secondary = "wpn_fps_lmg_m249_upg_secondary",
		wpn_fps_pis_rage_primary = "wpn_fps_pis_rage_upg_primary",
		wpn_fps_pis_rage_secondary = "wpn_fps_pis_rage_upg_secondary",
		wpn_fps_pis_peacemaker_primary = "wpn_fps_pis_peacemaker_upg_primary",
		wpn_fps_pis_peacemaker_secondary = "wpn_fps_pis_peacemaker_upg_secondary",
		wpn_fps_ass_flint_primary = "wpn_fps_ass_flint_upg_primary",
		wpn_fps_ass_flint_secondary = "wpn_fps_ass_flint_upg_secondary",
		wpn_fps_pis_breech_primary = "wpn_fps_pis_breech_upg_primary",
		wpn_fps_pis_breech_secondary = "wpn_fps_pis_breech_upg_secondary",
		wpn_fps_ass_74_primary = "wpn_fps_ass_74_upg_primary",
		wpn_fps_ass_74_secondary = "wpn_fps_ass_74_upg_secondary",
		wpn_fps_ass_ching_primary = "wpn_fps_ass_ching_upg_primary",
		wpn_fps_ass_ching_secondary = "wpn_fps_ass_ching_upg_secondary",
		wpn_fps_pis_lemming_primary = "wpn_fps_pis_lemming_upg_primary",
		wpn_fps_pis_lemming_secondary = "wpn_fps_pis_lemming_upg_secondary",
		wpn_fps_shot_m37_primary = "wpn_fps_shot_m37_upg_primary",
		wpn_fps_shot_m37_secondary = "wpn_fps_shot_m37_upg_secondary",
		wpn_fps_shot_r870_primary = "wpn_fps_shot_r870_upg_primary",
		wpn_fps_shot_r870_secondary = "wpn_fps_shot_r870_upg_secondary",
		wpn_fps_smg_erma_primary = "wpn_fps_smg_erma_upg_primary",
		wpn_fps_smg_erma_secondary = "wpn_fps_smg_erma_upg_secondary",
		wpn_fps_smg_schakal_primary = "wpn_fps_smg_schakal_upg_primary",
		wpn_fps_smg_schakal_secondary = "wpn_fps_smg_schakal_upg_secondary",
		wpn_fps_smg_tec9_primary = "wpn_fps_smg_tec9_upg_primary",
        wpn_fps_smg_tec9_secondary = "wpn_fps_smg_tec9_upg_secondary",
        wpn_fps_spe_rpg7_primary = "wpn_fps_spe_rpg7_upg_primary",
        wpn_fps_spe_rpg7_secondary = "wpn_fps_spe_rpg7_upg_secondary",
        wpn_fps_special_roach_primary = "wpn_fps_special_roach_upg_primary",
        wpn_fps_special_roach_secondary = "wpn_fps_special_roach_upg_secondary",
        wpn_fps_snp_msr_primary = "wpn_fps_snp_msr_upg_primary",
        wpn_fps_snp_msr_secondary = "wpn_fps_snp_msr_upg_secondary"
	}
end

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_WDUManager_Sync", function(sender, id, data)
    if id == "ZMUpdatePoints" then
        local points = tonumber(data)

        managers.wdu.players[sender].money = points

        if managers.hud then
            managers.wdu:_update_hud_element()
        end

        managers.wdu:_update_total_score(sender, points)
    end

    if id == "ZMWavesHighScore" then
        local max_waves = tonumber(data)
        managers.wdu.players[sender].max_waves_survived = max_waves
    end
end)

Hooks:Add("GameSetupUpdate", "VideoPanelUpdate", function(t, dt)
    if not alive(managers.wdu.video_panel) then
        return
    end

	if managers.wdu.video_panel and managers.wdu.video_panel:current_frame() >= managers.wdu.video_panel:frames() then
		managers.wdu.video_panel:parent():remove(managers.wdu.video_panel)
	end
end)