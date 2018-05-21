Hooks:PostHook(CopDamage, "init", "zm_disable_ammo_drop", function(self, unit)
    self._pickup = nil
end)

function CopDamage:drop_pickup(extra)
	return
end

function CopDamage:_dismember_condition(attack_data)
	return true
end

function CopDamage:_sync_dismember(attacker_unit)
	return true
end

function CopDamage:_check_special_death_conditions(variant, body, attacker_unit, weapon_unit)
	local special_deaths = self._unit:base():char_tweak().special_deaths

	if not special_deaths or not special_deaths[variant] then
		return
	end

	local body_data = special_deaths[variant][body:name():key()]

	if not body_data then
		return
	end

    if self._unit:damage():has_sequence(body_data.sequence) then
        self._unit:damage():run_sequence_simple(body_data.sequence)
    end

    if body_data.special_comment and attacker_unit == managers.player:player_unit() then
        return body_data.special_comment
    end
end

function CopDamage:get_damage_type(damage_percent, category)
	local hurt_table = self._char_tweak.damage.hurt_severity[category or "bullet"]
	local dmg = damage_percent / self._HEALTH_GRANULARITY

	if hurt_table.health_reference == "full" then
		-- Nothing
	else
		dmg = hurt_table.health_reference == "current" and math.min(1, (self._HEALTH_INIT * dmg) / self._health) or math.min(1, (self._HEALTH_INIT * dmg) / hurt_table.health_reference)
	end

	local zone = nil

	for i_zone, test_zone in ipairs(hurt_table.zones) do
		if i_zone == #hurt_table.zones or dmg < test_zone.health_limit then
			zone = test_zone

			break
		end
	end

	return "dmg_rcv"
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