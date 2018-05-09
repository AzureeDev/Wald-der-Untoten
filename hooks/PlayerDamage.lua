function PlayerDamage:_raw_max_health()
	local base_max_health = self._HEALTH_INIT + managers.player:health_skill_addend()
	local mul = managers.player:health_skill_multiplier()
	mul = managers.crime_spree:modify_value("PlayerDamage:GetMaxHealth", mul)

    local juggernog_mul = managers.player:has_special_equipment("perk_juggernog") and 2 or 1

	return (base_max_health * mul) * juggernog_mul
end

Hooks:PreHook(PlayerDamage, "on_downed", "zm_remove_perks_on_down", function(self)
    if managers.player:has_special_equipment("perk_juggernog") then
        managers.player:remove_special("perk_juggernog")
    end
    if managers.player:has_special_equipment("perk_speedcola") then
        managers.player:remove_special("perk_speedcola")
    end
    if managers.player:has_special_equipment("perk_doubletap") then
        managers.player:remove_special("perk_speedcola")
    end
    if managers.player:has_special_equipment("perk_speedcola") then
        managers.player:remove_special("perk_speedcola")
    end
end)