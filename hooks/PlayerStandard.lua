Hooks:PostHook(PlayerStandard, "init", "Railgun_SteelsightColor_PlayerStandard__init", function(self)
	self._in_steelsight_last = false
	self._in_steelsight_delault_color = managers.user:get_setting("video_color_grading")
	self._in_steelsight_use_color = "color_heat"
	self._pickup_area = 100
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

function PlayerStandard:_start_action_intimidate(t, secondary)
	if not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t then
		local skip_alert = managers.groupai:state():whisper_mode()
		local voice_type, plural, prime_target = self:_get_unit_intimidation_action(not secondary, not secondary, true, false, true, nil, nil, nil, secondary)

		if prime_target and prime_target.unit and prime_target.unit.base and (prime_target.unit:base().unintimidateable or prime_target.unit:anim_data() and prime_target.unit:anim_data().unintimidateable) then
			return
		end

		local interact_type, sound_name = nil
		local sound_suffix = plural and "plu" or "sin"

		if voice_type == "stop" then
			interact_type = "cmd_stop"
			sound_name = "f02x_" .. sound_suffix
		elseif voice_type == "mark_cop" or voice_type == "mark_cop_quiet" then
			interact_type = "cmd_point"

			if voice_type == "mark_cop_quiet" then
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
			else
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
				sound_name = managers.crime_spree:modify_value("PlayerStandart:_start_action_intimidate", sound_name, prime_target.unit)
															--  ^^^^^^^^^^^^^^ good job overgreed
			end

			if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
				prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
				managers.network:session():send_to_peers_synched("spot_enemy", prime_target.unit)
			end
		elseif voice_type == "down" then
			interact_type = "cmd_down"
			sound_name = "f02x_" .. sound_suffix
			self._shout_down_t = t
		elseif voice_type == "down_stay" then
			interact_type = "cmd_down"

			if self._shout_down_t and t < self._shout_down_t + 2 then
				sound_name = "f03b_any"
			else
				sound_name = "f03a_" .. sound_suffix
			end
		elseif voice_type == "come" then
			interact_type = "cmd_come"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)

			if static_data then
				local character_code = static_data.ssuffix
				sound_name = "f21" .. character_code .. "_sin"
			else
				sound_name = "f38_any"
			end
		elseif voice_type == "revive" then
			interact_type = "cmd_get_up"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)

			if not static_data then
				return
			end

			local character_code = static_data.ssuffix
			sound_name = "f36x_any"

			if math.random() < self._ext_movement:rally_skill_data().revive_chance then
				prime_target.unit:interaction():interact(self._unit)
			end

			self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
		elseif voice_type == "boost" then
			interact_type = "cmd_gogo"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)

			if not static_data then
				return
			end

			local character_code = static_data.ssuffix
			sound_name = "g18"
			self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
		elseif voice_type == "escort" then
			interact_type = "cmd_point"
			sound_name = "f41_" .. sound_suffix
		elseif voice_type == "escort_keep" or voice_type == "escort_go" then
			interact_type = "cmd_point"
			sound_name = "f40_any"
		elseif voice_type == "bridge_codeword" then
			sound_name = "bri_14"
			interact_type = "cmd_point"
		elseif voice_type == "bridge_chair" then
			sound_name = "bri_29"
			interact_type = "cmd_point"
		elseif voice_type == "undercover_interrogate" then
			sound_name = "f46x_any"
			interact_type = "cmd_point"
		elseif voice_type == "undercover_escort" then
			sound_name = "f41_any"
			interact_type = "cmd_point"
		elseif voice_type == "mark_camera" then
			sound_name = "f39_any"
			interact_type = "cmd_point"

			prime_target.unit:contour():add("mark_unit", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		elseif voice_type == "mark_turret" then
			sound_name = "f44x_any"
			interact_type = "cmd_point"
			local type = prime_target.unit:base().get_type and prime_target.unit:base():get_type()

			prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(type), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		elseif voice_type == "ai_stay" then
			sound_name = "f48x_any"
			interact_type = "cmd_stop"
		end

		self:_do_action_intimidate(t, interact_type, sound_name, skip_alert)
	end
end