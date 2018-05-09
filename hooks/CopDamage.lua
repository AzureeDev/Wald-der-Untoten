Hooks:PostHook(CopDamage, "init", "zm_disable_ammo_drop", function(self, unit)
    self._pickup = nil
end)

function CopDamage:drop_pickup(extra)
	return
end

Hooks:PreHook(CopDamage, "damage_explosion", "zm_instakill_explosion", function(self, attack_data)
    if managers.statistics.events.instakill_active then
        self._health = 1
    end
end)

Hooks:PreHook(CopDamage, "damage_fire", "zm_instakill_fire", function(self, attack_data)
    if managers.statistics.events.instakill_active then
        self._health = 1
    end
end)

Hooks:PreHook(CopDamage, "damage_tase", "zm_instakill_tase", function(self, attack_data)
    if managers.statistics.events.instakill_active then
        self._health = 1
    end
end)

Hooks:PreHook(CopDamage, "damage_simple", "zm_instakill_simple", function(self, attack_data)
    if managers.statistics.events.instakill_active then
        self._health = 1
    end
end)

Hooks:PreHook(CopDamage, "damage_melee", "zm_instakill_melee", function(self, attack_data)
    if managers.statistics.events.instakill_active then
        self._health = 1
    end
end)

Hooks:PreHook(CopDamage, "damage_bullet", "zm_instakill_bullet", function(self, attack_data)
    if managers.statistics.events.instakill_active then
        self._health = 1
    end
end)

Hooks:PostHook(CopDamage, "damage_bullet", "zm_points_on_hit", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.statistics:_get_local_peer_id()
        local hit_points = managers.statistics.events.double_point_active and 20 or 10

        managers.statistics:_add_zm_points(hit_points, peer_id)
    end
end)
