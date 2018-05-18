Hooks:PostHook(CopDamage, "init", "zm_disable_ammo_drop", function(self, unit)
    self._pickup = nil
end)

function CopDamage:drop_pickup(extra)
	return
end

Hooks:PreHook(CopDamage, "damage_explosion", "zm_instakill_explosion", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_fire", "zm_instakill_fire", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_tase", "zm_instakill_tase", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_simple", "zm_instakill_simple", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_melee", "zm_instakill_melee", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

Hooks:PreHook(CopDamage, "damage_bullet", "zm_instakill_bullet", function(self, attack_data)
    if self._dead or self._invulnerable then
		return
    end

    if managers.wdu:_is_event_active("instakill") then
        self._health = 1
    end

    if attack_data.attacker_unit == managers.player:player_unit() then
        local peer_id = managers.wdu:_peer_id()
        local hit_points = managers.wdu.level.active_events.double_points and 20 or 10

        managers.wdu:_add_money_to(peer_id, hit_points)
    end
end)

function CopDamage:_spawn_head_gadget(params)
	if not self._head_gear then
		return
	end

	if self._head_gear_object then
		if self._head_gear_decal_mesh then
			local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)

			self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("flesh"))
		end
    end
    
	self._head_gear = false
end