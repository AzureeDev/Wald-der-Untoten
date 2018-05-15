function RaycastWeaponBase:reload_speed_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
	multiplier = multiplier * (managers.player:has_special_equipment("perk_speedcola") and 2 or 1)

	return multiplier
end

function RaycastWeaponBase:fire_rate_multiplier()
	local multiplier = 1
	multiplier = multiplier * (managers.player:has_special_equipment("perk_doubletap") and 1.25 or 1)

	return multiplier
end

function RaycastWeaponBase:damage_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "damage_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "damage_multiplier", 1)
	multiplier = multiplier * (managers.player:has_special_equipment("perk_doubletap") and 1.25 or 1)

	return multiplier
end