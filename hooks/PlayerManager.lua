local function get_as_digested(amount)
	local list = {}

	for i = 1, #amount, 1 do
		table.insert(list, Application:digest_value(amount[i], false))
	end

	return list
end

local function make_double_hud_string(a, b)
	return string.format("%01d|%01d", a, b)
end

local function add_hud_item(amount, icon)
	if #amount > 1 then
		managers.hud:add_item_from_string({
			amount_str = make_double_hud_string(amount[1], amount[2]),
			amount = amount,
			icon = icon
		})
	else
		managers.hud:add_item({
			amount = amount[1],
			icon = icon
		})
	end
end

local function set_hud_item_amount(index, amount)
	if #amount > 1 then
		managers.hud:set_item_amount_from_string(index, make_double_hud_string(amount[1], amount[2]), amount)
	else
		managers.hud:set_item_amount(index, amount[1])
	end
end


Hooks:PreHook(PlayerManager, "init", "zm_init_perk", function(self)
    self._has_perk_juggernog = false
    self._wunderwaffe_unlocked = false
    self._roach_unlocked = false
	self.totalCopAlive = 0
	self._show_point_list = false
end)

Hooks:PostHook(PlayerManager, "update", "zm_upd_perk", function(self, t, dt)
	if not self._show_point_list then
		DelayedCalls:Add( "ZmShowPointsDelay", 2, function()
			managers.wdu:_update_hud_element()
		end)
		
		self._show_point_list = true
	end

    local player = self:player_unit()

    if self:has_special_equipment("perk_juggernog") then
        if not self._has_perk_juggernog then
            player:character_damage():replenish()
            local new_health = tonumber(player:character_damage():_max_health()) * 2
            player:character_damage():change_health(new_health)
            self._has_perk_juggernog = true
        end
    end

    if not self._wunderwaffe_unlocked then
        local current_state = self:get_current_state()
        if current_state then
            local current_weapon = current_state:get_equipped_weapon()
            if current_weapon.name_id == "wunderwaffe_primary" or current_weapon.name_id == "wunderwaffe_secondary" then
                local lip = SoundDevice:create_source("lip")
                lip:post_event("zm_announcer_wunder")
                LuaNetworking:SendToPeers( "ZMWunderwaffeUnlocked", "1" )
                self._wunderwaffe_unlocked = true
            end
        end
    end

    if not self._roach_unlocked then
        local current_state = self:get_current_state()
        if current_state then
            local current_weapon = current_state:get_equipped_weapon()
            if current_weapon.name_id == "roach_primary" or current_weapon.name_id == "roach_secondary" then
                local lip = SoundDevice:create_source("lip")
                lip:post_event("zm_announcer_roach")
                LuaNetworking:SendToPeers( "ZMRoachUnlocked", "1" )
                self._roach_unlocked = true
            end
        end
    end

    local current_state = self:get_current_state()
    if current_state then
        local current_weapon = current_state:get_equipped_weapon()

        local weapon = current_weapon.name_id
        local weapon_name_id = managers.localization:text(tweak_data.weapon[weapon].name_id)

        if weapon == "nothing2_primary" then
            weapon_name_id = ""
        end

		managers.hud._hud_zm_waves.weapon_name_bottom_right:set_text(tostring(weapon_name_id))
		
		current_weapon:_update_rof_on_perk()
    end

	self:_count_nb_perks()
end)

function PlayerManager:_count_nb_perks()
	local count_perks = 0

	if self:has_special_equipment("perk_quickrevive") then count_perks = count_perks + 1 end
    if self:has_special_equipment("perk_juggernog") then count_perks = count_perks + 1 end
    if self:has_special_equipment("perk_speedcola") then count_perks = count_perks + 1 end
    if self:has_special_equipment("perk_doubletap") then count_perks = count_perks + 1 end
	if self:has_special_equipment("perk_deadshot") then count_perks = count_perks + 1 end
	
	return count_perks
end

function PlayerManager:_update_cops_alive(change)
    self.totalCopAlive = self.totalCopAlive + change
end

function PlayerManager:check_skills()
	self:send_message_now("check_skills")
	self._coroutine_mgr:clear()

	self._saw_panic_when_kill = self:has_category_upgrade("saw", "panic_when_kill")
	self._unseen_strike = self:has_category_upgrade("player", "unseen_increased_crit_chance")

	if self:has_category_upgrade("pistol", "stacked_accuracy_bonus") then
		self._message_system:register(Message.OnEnemyShot, self, callback(self, self, "_on_expert_handling_event"))
	else
		self._message_system:unregister(Message.OnEnemyShot, self)
	end

	if self:has_category_upgrade("pistol", "stacking_hit_damage_multiplier") then
		self._message_system:register(Message.OnEnemyShot, "trigger_happy", callback(self, self, "_on_enter_trigger_happy_event"))
	else
		self._message_system:unregister(Message.OnEnemyShot, "trigger_happy")
	end

	if self:has_category_upgrade("player", "melee_damage_stacking") then

		-- Lines: 166 to 175
		local function start_bloodthirst_base(weapon_unit, variant)
			if variant ~= "melee" and not self._coroutine_mgr:is_running(PlayerAction.BloodthirstBase) then
				local data = self:upgrade_value("player", "melee_damage_stacking", nil)

				if data and type(data) ~= "number" then
					self._coroutine_mgr:add_coroutine(PlayerAction.BloodthirstBase, PlayerAction.BloodthirstBase, self, data.melee_multiplier, data.max_multiplier)
				end
			end
		end

		self._message_system:register(Message.OnEnemyKilled, "bloodthirst_base", start_bloodthirst_base)
	else
		self._message_system:unregister(Message.OnEnemyKilled, "bloodthirst_base")
	end

	if self:has_category_upgrade("player", "messiah_revive_from_bleed_out") then
		self._messiah_charges = self:upgrade_value("player", "messiah_revive_from_bleed_out", 0)
		self._max_messiah_charges = self._messiah_charges

		self._message_system:register(Message.OnEnemyKilled, "messiah_revive_from_bleed_out", callback(self, self, "_on_messiah_event"))
	else
		self._messiah_charges = 0
		self._max_messiah_charges = self._messiah_charges

		self._message_system:unregister(Message.OnEnemyKilled, "messiah_revive_from_bleed_out")
	end

	if self:has_category_upgrade("player", "recharge_messiah") then
		self._message_system:register(Message.OnDoctorBagUsed, "recharge_messiah", callback(self, self, "_on_messiah_recharge_event"))
	else
		self._message_system:unregister(Message.OnDoctorBagUsed, "recharge_messiah")
	end

	if self:has_category_upgrade("player", "double_drop") then
		self._target_kills = self:upgrade_value("player", "double_drop", 0)

		self._message_system:register(Message.OnEnemyKilled, "double_ammo_drop", callback(self, self, "_on_spawn_extra_ammo_event"))
	else
		self._target_kills = 0

		self._message_system:unregister(Message.OnEnemyKilled, "double_ammo_drop")
	end

	if self:has_category_upgrade("temporary", "single_shot_fast_reload") then
		self._message_system:register(Message.OnLethalHeadShot, "activate_aggressive_reload", callback(self, self, "_on_activate_aggressive_reload_event"))
	else
		self._message_system:unregister(Message.OnLethalHeadShot, "activate_aggressive_reload")
	end

	if self:has_category_upgrade("player", "head_shot_ammo_return") then
		self._ammo_efficiency = self:upgrade_value("player", "head_shot_ammo_return", nil)

		self._message_system:register(Message.OnHeadShot, "ammo_efficiency", callback(self, self, "_on_enter_ammo_efficiency_event"))
	else
		self._ammo_efficiency = nil

		self._message_system:unregister(Message.OnHeadShot, "ammo_efficiency")
	end

	if self:has_category_upgrade("player", "melee_kill_increase_reload_speed") then
		self._message_system:register(Message.OnEnemyKilled, "bloodthirst_reload_speed", callback(self, self, "_on_enemy_killed_bloodthirst"))
	else
		self._message_system:unregister(Message.OnEnemyKilled, "bloodthirst_reload_speed")
	end

	self._super_syndrome_count = 99999

	if self:has_category_upgrade("player", "dodge_shot_gain") then
		local last_gain_time = 0
		local dodge_gain = self:upgrade_value("player", "dodge_shot_gain")[1]
		local cooldown = self:upgrade_value("player", "dodge_shot_gain")[2]


		-- Lines: 229 to 235
		local function on_player_damage(attack_data)
			local t = TimerManager:game():time()

			if attack_data.variant == "bullet" and last_gain_time + cooldown < t then
				last_gain_time = t

				managers.player:_dodge_shot_gain(managers.player:_dodge_shot_gain() + dodge_gain)
			end
		end

		self:register_message(Message.OnPlayerDodge, "dodge_shot_gain_dodge", callback(self, self, "_dodge_shot_gain", 0))
		self:register_message(Message.OnPlayerDamage, "dodge_shot_gain_damage", on_player_damage)
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_shot_gain_dodge")
		self:unregister_message(Message.OnPlayerDamage, "dodge_shot_gain_damage")
	end

	if self:has_category_upgrade("player", "dodge_replenish_armor") then
		self:register_message(Message.OnPlayerDodge, "dodge_replenish_armor", callback(self, self, "_dodge_replenish_armor"))
	else
		self:unregister_message(Message.OnPlayerDodge, "dodge_replenish_armor")
	end

	self:add_coroutine("damage_control", PlayerAction.DamageControl)

	if self:has_category_upgrade("snp", "graze_damage") then
		self:register_message(Message.OnWeaponFired, "graze_damage", callback(SniperGrazeDamage, SniperGrazeDamage, "on_weapon_fired"))
	else
		self:unregister_message(Message.OnWeaponFired, "graze_damage")
    end
    
    self:register_message(Message.OnWeaponFired, "wunderwaffe_shot", callback(SniperGrazeDamage, SniperGrazeDamage, "on_wunderwaffe_fired"))
end

function PlayerManager:_internal_load()
	local player = self:player_unit()

	if not player then
		return
	end

	local default_weapon_selection = 1
	local secondary = managers.blackmarket:equipped_secondary()
	local secondary_slot = managers.blackmarket:equipped_weapon_slot("secondaries")
	local texture_switches = managers.blackmarket:get_weapon_texture_switches("secondaries", secondary_slot, secondary)

	player:inventory():add_unit_by_factory_name(secondary.factory_id, default_weapon_selection == 1, false, secondary.blueprint, secondary.cosmetics, texture_switches)

	local primary = managers.blackmarket:equipped_primary()

	if primary then
		local primary_slot = managers.blackmarket:equipped_weapon_slot("primaries")
		local texture_switches = managers.blackmarket:get_weapon_texture_switches("primaries", primary_slot, primary)

		player:inventory():add_unit_by_factory_name(primary.factory_id, default_weapon_selection == 2, false, primary.blueprint, primary.cosmetics, texture_switches)
	end

	player:inventory():set_melee_weapon("zdann")

	local peer_id = managers.network:session():local_peer():id()
	local grenade, amount = managers.blackmarket:equipped_grenade()

	if self:has_grenade(peer_id) then
		amount = self:get_grenade_amount(peer_id) or amount
	end

	amount = managers.crime_spree:modify_value("PlayerManager:GetThrowablesMaxAmount", amount)

	self:_set_grenade({
		grenade = grenade,
		amount = math.min(amount, self:get_max_grenades())
	})
	self:_set_body_bags_amount(self._local_player_body_bags or self:total_body_bags())

	if self._respawn then
		-- Nothing
	else
		self:_add_level_equipment(player)

		for i, name in ipairs(self._global.default_kit.special_equipment_slots) do
			local ok_name = self._global.equipment[name] and name

			if ok_name then
				local upgrade = tweak_data.upgrades.definitions[ok_name]

				if upgrade and (upgrade.slot and upgrade.slot < 2 or not upgrade.slot) then
					self:add_equipment({
						silent = true,
						equipment = upgrade.equipment_id
					})
				end
			end
		end

		local slot = 2

		if self:has_category_upgrade("player", "second_deployable") then
			slot = 3
		else
			self:set_equipment_in_slot(nil, 2)
		end

		local equipment_list = self:equipment_slots()

		for i, name in ipairs(equipment_list) do
			local ok_name = self._global.equipment[name] and name or self:equipment_in_slot(i)

			if ok_name then
				local upgrade = tweak_data.upgrades.definitions[ok_name]

				if upgrade and (upgrade.slot and upgrade.slot < slot or not upgrade.slot) then
					self:add_equipment({
						silent = true,
						equipment = upgrade.equipment_id,
						slot = i
					})
				end
			end
		end

		self:update_deployable_selection_to_peers()
	end

	if self:has_category_upgrade("player", "cocaine_stacking") then
		self:update_synced_cocaine_stacks_to_peers(0, self:upgrade_value("player", "sync_cocaine_upgrade_level", 1), self:upgrade_level("player", "cocaine_stack_absorption_multiplier", 0))
		managers.hud:set_info_meter(nil, {
			icon = "guis/dlcs/coco/textures/pd2/hud_absorb_stack_icon_01",
			max = 1,
			current = self:get_local_cocaine_damage_absorption_ratio(),
			total = self:get_local_cocaine_damage_absorption_max_ratio()
		})
	end

	self:update_cocaine_hud()

	local equipment = self:selected_equipment()

	if equipment then
		add_hud_item(get_as_digested(equipment.amount), equipment.icon)
	end

	if self:has_equipment("armor_kit") then
		managers.mission:call_global_event("player_regenerate_armor", true)
	end
end


Hooks:Add("NetworkReceivedData", "NetworkReceivedData_Wunderwaffe_unlock", function(sender, id, data)
    if id == "ZMWunderwaffeUnlocked" then
        local lip = SoundDevice:create_source("lip")
        lip:post_event("zm_announcer_wunder")
        managers.player._wunderwaffe_unlocked = true
    end

    if id == "ZMRoachUnlocked" then
        local lip = SoundDevice:create_source("lip")
        lip:post_event("zm_announcer_roach")
        managers.player._roach_unlocked = true
    end
end)

function PlayerManager:on_enter_custody(_player, already_dead)
	local player = _player or self:player_unit()

	if not player then
		Application:error("[PlayerManager:on_enter_custody] Unable to get player")

		return
	end

	if player == self:player_unit() then
		local equipped_grenade = managers.blackmarket:equipped_grenade()

		if equipped_grenade and tweak_data.blackmarket.projectiles[equipped_grenade] and tweak_data.blackmarket.projectiles[equipped_grenade].ability then
			self:reset_ability_hud()
		end
	end

	managers.mission:call_global_event("player_in_custody")

	local peer_id = managers.network:session():local_peer():id()

	self:force_drop_carry()
	managers.statistics:downed({death = true})

	if not already_dead then
		player:network():send("sync_player_movement_state", "dead", player:character_damage():down_time(), player:id())
		managers.groupai:state():on_player_criminal_death(peer_id)
	end

	self._listener_holder:call(self._custody_state, player)
	game_state_machine:change_state_by_name("ingame_waiting_for_respawn")
	player:character_damage():set_invulnerable(true)
	player:character_damage():set_health(0)
	player:base():_unregister()
	World:delete_unit(player)
	managers.hud:remove_interact()
end