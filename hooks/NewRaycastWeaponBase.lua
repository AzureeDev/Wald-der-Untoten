function NewRaycastWeaponBase:reload_speed_multiplier()
	if self._current_reload_speed_multiplier then
		return self._current_reload_speed_multiplier
	end

	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier + 1 - managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
	end

	multiplier = multiplier + 1 - managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier + 1 - managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)

	if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
		local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()

		if morale_boost_bonus then
			multiplier = multiplier + 1 - morale_boost_bonus.reload_speed_bonus
		end

		if self._setup.user_unit:movement():next_reload_speed_multiplier() then
			multiplier = multiplier + 1 - self._setup.user_unit:movement():next_reload_speed_multiplier()
		end
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "reload_weapon_faster") then
		multiplier = multiplier + 1 - managers.player:temporary_upgrade_value("temporary", "reload_weapon_faster", 1)
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "single_shot_fast_reload") then
		multiplier = multiplier + 1 - managers.player:temporary_upgrade_value("temporary", "single_shot_fast_reload", 1)
	end

	multiplier = multiplier + 1 - managers.player:get_property("shock_and_awe_reload_multiplier", 1)
	multiplier = multiplier + 1 - managers.player:get_temporary_property("bloodthirst_reload_speed", 1)
	multiplier = multiplier + 1 - managers.player:upgrade_value("team", "crew_faster_reload", 1)
	multiplier = self:_convert_add_to_mul(multiplier)
	multiplier = multiplier * self:reload_speed_stat()
    multiplier = managers.crime_spree:modify_value("WeaponBase:GetReloadSpeedMultiplier", multiplier)
    multiplier = multiplier * (managers.player:has_special_equipment("perk_speedcola") and 2 or 1)

	return multiplier
end

Hooks:PostHook(NewRaycastWeaponBase, "init", "Waffe_AddBulletTrail", function(self)
	local allowed_weapons = {
		"wunderwaffe_primary",
		"wunderwaffe_secondary",
		"wunderwaffe_dg3_primary",
		"wunderwaffe_dg3_secondary"
	}

	for k, v in pairs(allowed_weapons) do
		if self._name_id == v then

			self.TRAIL_EFFECT = Idstring("effects/particles/weapons/shovel")

			if v == "wunderwaffe_dg3_primary" or v == "wunderwaffe_dg3_secondary" then
				self.TRAIL_EFFECT = Idstring("effects/particles/weapons/super_shovel")
			end

			self._trail_effect_table = {
				effect = self.TRAIL_EFFECT,
				position = Vector3(),
				normal = Vector3()
			}
	   end
	end
end)

Hooks:PostHook(NewRaycastWeaponBase, "fire", "Waffe_FireBulletTrail", function(self, from_pos, direction)
	local allowed_weapons = {
		"wunderwaffe_primary",
		"wunderwaffe_secondary",
		"wunderwaffe_dg3_primary",
		"wunderwaffe_dg3_secondary"
	}

	for k, v in pairs(allowed_weapons) do
		if self._name_id == v then
			self._obj_fire:m_position(self._trail_effect_table.position)
			mvector3.set(self._trail_effect_table.normal, direction)
			World:effect_manager():spawn(self._trail_effect_table)
		end
	end
end)