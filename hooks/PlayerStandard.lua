Hooks:PostHook(PlayerStandard, "init", "Railgun_SteelsightColor_PlayerStandard__init", function(self)
	self._in_steelsight_last = false
	self._in_steelsight_delault_color = managers.user:get_setting("video_color_grading")
	self._in_steelsight_use_color = "color_heat"
end)

Hooks:PostHook(PlayerStandard, "_check_action_steelsight", "Railgun_SteelsightColor_PlayerStandard__check_action_steelsight", function(self)
	if self._in_steelsight_last ~= self:in_steelsight() then
		self._in_steelsight_last = self:in_steelsight()
		local _blueprint = self._ext_inventory:equipped_unit():base()._blueprint
		if not table.contains(_blueprint, "wpn_fps_special_roach_irons") then
			return
		end
		if not self._in_steelsight_last then
			managers.user:set_setting("video_color_grading", self._in_steelsight_delault_color)
		else
			managers.user:set_setting("video_color_grading", self._in_steelsight_use_color)
		end
		if managers.environment_controller then
			managers.environment_controller:refresh_render_settings()
		end
	end
end)

Hooks:PostHook(PlayerStandard, "_start_action_equip_weapon", "zm_weapon_name_on_switch", function(self, t)
	local weapon = self._ext_inventory:equipped_unit():base()._name_id
	local weapon_name_id = managers.localization:text(tweak_data.weapon[weapon].name_id)

	if weapon == "nothing2_primary" then
		weapon_name_id = ""
	end

	managers.hud._hud_zm_waves.weapon_name_bottom_right:set_text(tostring(weapon_name_id))
end)

-- Following fix below is made by Pawcio / >:3

function PlayerStandard:_start_action_reload_enter(t)
    if self._equipped_unit:base():can_reload() then
        local weapon = self._equipped_unit:base()
        local tweak_data = weapon:weapon_tweak_data()
        managers.player:send_message_now(Message.OnPlayerReload, nil, self._equipped_unit)
        self:_interupt_action_steelsight(t)
        if not self.RUN_AND_RELOAD then
            self:_interupt_action_running(t)
        end
        if self._equipped_unit:base():reload_enter_expire_t() then
            local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
            self._ext_camera:play_redirect(Idstring("reload_enter_" .. weapon:weapon_tweak_data().animations.reload_name_id), speed_multiplier)
            self._state_data.reload_enter_expire_t = t + self._equipped_unit:base():reload_enter_expire_t() / speed_multiplier
            self._equipped_unit:base():tweak_data_anim_play("reload_enter", speed_multiplier)
            return
        end
        self:_start_action_reload(t)
    end
end