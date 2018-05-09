Hooks:PostHook(StatisticsManager, "init", "zm_init_points", function(self)
    self._zm_points = {
        [1] = 500,
        [2] = 500,
        [3] = 500,
        [4] = 500
    }

    self.events = {}
    self.events.double_point_active = false
    self.events.instakill_active = false
    self.events.firesale_active = false

    self.ZOMBIES_CURRENTLY_SPAWNED = 0

    self.ZOMBIES_SPAWN = 8
    self.ZOMBIES_KILLED = 0
    self.ZOMBIES_SPAWN_MULT_BASE = 6
end)

function StatisticsManager:_multiply_nb_zombies_by_current_wave(current_wave)
    self.ZOMBIES_SPAWN = self.ZOMBIES_SPAWN + (self.ZOMBIES_SPAWN_MULT_BASE + current_wave)
end

function StatisticsManager:_get_local_peer_id()
	return Global.game_settings.single_player and 1 or managers.network:session() and managers.network:session():local_peer():id() or 1
end

Hooks:PostHook(StatisticsManager, "killed", "zm_init_add_zmpoints", function(self, data)
    local ZMPTweakData = {}
    local double_point_effect = self.events.double_point_active and 2 or 1
    ZMPTweakData.points = {}
	ZMPTweakData.points.kill = {}
	ZMPTweakData.points.kill["default"] = 50 * double_point_effect
	ZMPTweakData.points.kill["shield"] = 80 * double_point_effect
	ZMPTweakData.points.kill["spooc"] = 120 * double_point_effect
	ZMPTweakData.points.kill["tank"] = 150 * double_point_effect
	ZMPTweakData.points.kill["tank_hw"] = 200 * double_point_effect
	ZMPTweakData.points.kill["tank_green"] = 150 * double_point_effect
	ZMPTweakData.points.kill["tank_black"] = 160 * double_point_effect
	ZMPTweakData.points.kill["tank_skull"] = 180 * double_point_effect
	ZMPTweakData.points.kill["taser"] = 100 * double_point_effect
	ZMPTweakData.points.kill["medic"] = 80 * double_point_effect
	ZMPTweakData.points.kill["sniper"] = 95 * double_point_effect

	ZMPTweakData.points.bonus = {}
	ZMPTweakData.points.bonus["headshot"] = 50 * double_point_effect
    ZMPTweakData.points.bonus["melee_kill"] = 130 * double_point_effect

    local peer_id = self:_get_local_peer_id()
	local by_bullet = data.variant == "bullet"
	local by_melee = data.variant == "melee" or data.weapon_id and tweak_data.blackmarket.melee_weapons[data.weapon_id]
	local by_explosion = data.variant == "explosion"
	local by_other_variant = not by_bullet and not by_melee and not by_explosion

	if by_bullet then
		if ZMPTweakData.points.kill[data.name] then
			self:_add_zm_points(ZMPTweakData.points.kill[data.name] + (data.head_shot and ZMPTweakData.points.bonus["headshot"] or 0), peer_id)
		else
            self:_add_zm_points(ZMPTweakData.points.kill["default"] + (data.head_shot and ZMPTweakData.points.bonus["headshot"] or 0), peer_id)
		end

	elseif by_melee then
        if ZMPTweakData.points.kill[data.name] then
            self:_add_zm_points(ZMPTweakData.points.bonus["melee_kill"], peer_id)
        else
            self:_add_zm_points(ZMPTweakData.points.bonus["melee_kill"], peer_id)
        end
	elseif by_explosion then
        if ZMPTweakData.points.kill[data.name] then
            self:_add_zm_points(ZMPTweakData.points.kill[data.name], peer_id)
        else
            self:_add_zm_points(ZMPTweakData.points.kill["default"], peer_id)
        end
	elseif by_other_variant then
        if ZMPTweakData.points.kill[data.name] then
            self:_add_zm_points(ZMPTweakData.points.kill[data.name], peer_id)
        else
            self:_add_zm_points(ZMPTweakData.points.kill["default"], peer_id)
        end
	end
end)

function StatisticsManager:_own_zm_points()
    local peer = self:_get_local_peer_id()
    return self._zm_points[peer]
end

function StatisticsManager:_add_zm_points(nb, peer_id)
    local Net = _G.LuaNetworking
    if nb and type(nb) == "number" then
        local floor_nb = math.floor(nb)
        self._zm_points[peer_id] = self._zm_points[peer_id] + floor_nb
        Net:SendToPeers( "ZMUpdatePoints", tostring(self:_own_zm_points()) )
        self:_update_zm_hud_element()
    end
end

function StatisticsManager:_remove_zm_points(nb, peer_id)
    local Net = _G.LuaNetworking
    if nb and type(nb) == "number" then
        if tonumber(self._zm_points[peer_id]) >= nb then
            local floor_nb = math.floor(nb)
            self._zm_points[peer_id] = self._zm_points[peer_id] - floor_nb
        end
        Net:SendToPeers( "ZMUpdatePoints", tostring(self:_own_zm_points()) )
        self:_update_zm_hud_element()
    end
end

function StatisticsManager:_update_zm_hud_element()
    if not Global.game_settings.single_player then
        for _, peer in pairs(managers.network:session():all_peers()) do

            local is_me = peer:id() == self:_get_local_peer_id()

            Steam:friend_avatar(2, peer:user_id(), function (texture)
                local is_me = peer:id() == self:_get_local_peer_id()
        		local avatar = texture or "guis/textures/pd2/none_icon"
                managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_image(avatar)
        		managers.hud._hud_zm_points._zmp_avatars[peer:id()]:set_visible(true)
        	end)
            managers.hud._hud_zm_points._zmp_points[peer:id()]:set_text(tostring(managers.statistics._zm_points[peer:id()]))
            managers.hud._hud_zm_points._zmp_points[peer:id()]:set_visible(true)
        end
    else
        Steam:friend_avatar(2, Steam:userid(), function (texture)
            local avatar = texture or "guis/textures/pd2/none_icon"
            managers.hud._hud_zm_points._zmp_avatars[1]:set_image(avatar)
            managers.hud._hud_zm_points._zmp_avatars[1]:set_visible(true)
        end)
        managers.hud._hud_zm_points._zmp_points[1]:set_text(tostring(managers.statistics._zm_points[1]))
        managers.hud._hud_zm_points._zmp_points[1]:set_visible(true)
    end
end

Hooks:Add("NetworkReceivedData", "NetworkReceivedData_ZMPs", function(sender, id, data)
    if id == "ZMUpdatePoints" then
        local points = data
        managers.statistics._zm_points[sender] = tonumber(points)
        managers.statistics:_update_zm_hud_element()
    end
end)