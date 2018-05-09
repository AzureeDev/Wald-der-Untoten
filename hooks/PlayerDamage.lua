function PlayerDamage:_check_little_revive()
    local is_solo = Global.game_settings.single_player and true or false
    local has_little_revive = managers.player:has_special_equipment("perk_quickrevive")
    self._little_revive_effect = {}

    if has_little_revive then
        if is_solo then
            self._little_revive_effect["primis"] = "autorevive"
            self._little_revive_effect["sub"] = nil
            return
        end

        self._little_revive_effect["primis"] = "extradown"
        self._little_revive_effect["sub"] = "inspire"
    end
end

function PlayerDamage:_check_juggernog()
    local has_juggernog = managers.player:has_special_equipment("perk_juggernog")
    self._juggernog_effect = {}

    if has_juggernog then
        self._juggernog_effect["primis"] = "multhealth"
        self._juggernog_effect["sub"] = "grinder"
    end
end

function PlayerDamage:_check_speed_cola()
    local has_speed_cola = managers.player:has_special_equipment("perk_speedcola")
    self._speed_cola_effect = {}

    if has_speed_cola then
        self._speed_cola_effect["primis"] = "reloadspeed"
        self._speed_cola_effect["sub"] = "movement"
    end
end

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
end)