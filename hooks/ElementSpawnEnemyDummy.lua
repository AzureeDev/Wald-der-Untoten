core:import("CoreMissionScriptElement")
ElementSpawnEnemyDummy = ElementSpawnEnemyDummy or class(CoreMissionScriptElement.MissionScriptElement)

function ElementSpawnEnemyDummy:client_on_executed(...)
	if managers.wdu:_is_special_wave() then
		local pos, rot = self:get_orientation()

		World:effect_manager():spawn({
			effect = Idstring("effects/zm/zm_special_spawn"),
			position = pos
		})

		managers.wdu:_element_play_sound({
			name = self._id,
			custom_dir = "sound",
			file_name = "special_spawn.ogg",
			is_loop = false,
			is_relative = false
		})

		DelayedCalls:Add("zm_shake_little_delay", 1.6, function()
			if alive(managers.player:player_unit()) then
				local feedback = managers.feedback:create("mission_triggered")
				feedback:set_unit(managers.player:player_unit())
				feedback:set_enabled("camera_shake", true)
				feedback:set_enabled("rumble", true)
				feedback:set_enabled("above_camera_effect", false)

				local params = {
					"camera_shake",
					"multiplier",
					1,
					"camera_shake",
					"amplitude",
					0.5,
					"camera_shake",
					"attack",
					0.05,
					"camera_shake",
					"sustain",
					0.15,
					"camera_shake",
					"decay",
					0.5,
					"rumble",
					"multiplier_data",
					1,
					"rumble",
					"peak",
					0.5,
					"rumble",
					"attack",
					0.05,
					"rumble",
					"sustain",
					0.15,
					"rumble",
					"release",
					0.5
				}

				feedback:play(unpack(params))
			end
		end)
	end
end

function ElementSpawnEnemyDummy:produce(params)
	if not managers.groupai:state():is_AI_enabled() then
		return
    end

    if managers.wdu.level.zombies.currently_spawned >= math.floor(managers.wdu.level.zombies.max_spawns) then
        return
    end
	
	local units_special_wave = {}

	if managers.wdu:_is_special_wave() then
		if managers.player.totalCopAlive >= managers.wdu:_get_max_special_wave_spawns() then
			return
		end

		units_special_wave = {
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
		}

		local pos, rot = self:get_orientation()

		World:effect_manager():spawn({
			effect = Idstring("effects/zm/zm_special_spawn"),
			position = pos
		})

		managers.wdu:_element_play_sound({
			name = self._id,
			custom_dir = "sound",
			file_name = "special_spawn.ogg",
			is_loop = false,
			is_relative = false
		})

		DelayedCalls:Add("zm_shake_little_delay", 1.6, function()
			if alive(managers.player:player_unit()) then
				local feedback = managers.feedback:create("mission_triggered")
				feedback:set_unit(managers.player:player_unit())
				feedback:set_enabled("camera_shake", true)
				feedback:set_enabled("rumble", true)
				feedback:set_enabled("above_camera_effect", false)

				local params = {
					"camera_shake",
					"multiplier",
					1,
					"camera_shake",
					"amplitude",
					0.5,
					"camera_shake",
					"attack",
					0.05,
					"camera_shake",
					"sustain",
					0.15,
					"camera_shake",
					"decay",
					0.5,
					"rumble",
					"multiplier_data",
					1,
					"rumble",
					"peak",
					0.5,
					"rumble",
					"attack",
					0.05,
					"rumble",
					"sustain",
					0.15,
					"rumble",
					"release",
					0.5
				}

				feedback:play(unpack(params))
			end
		end)
	end

	managers.wdu.level.zombies.currently_spawned = managers.wdu.level.zombies.currently_spawned + 1

	if params and params.name then
		local unit

		if managers.wdu:_is_special_wave() then
			unit = safe_spawn_unit(units_special_wave[ math.random( #units_special_wave ) ], self:get_orientation())
		else
			unit = safe_spawn_unit(params.name, self:get_orientation())
		end

		unit:base():add_destroy_listener(self._unit_destroy_clbk_key, callback(self, self, "clbk_unit_destroyed"))

		unit:unit_data().mission_element = self
		local spawn_ai = self:_create_spawn_AI_parametric(params.stance, params.objective, self._values)

		unit:brain():set_spawn_ai(spawn_ai)
		table.insert(self._units, unit)
		self:event("spawn", unit)

		if self._values.force_pickup and self._values.force_pickup ~= "none" then
			local pickup_name = self._values.force_pickup ~= "no_pickup" and self._values.force_pickup or nil

			unit:character_damage():set_pickup(pickup_name)
		end
	else
		local enemy_name

		if managers.wdu:_is_special_wave() then
			enemy_name = units_special_wave[ math.random( #units_special_wave ) ]
		else
			enemy_name = self:value("enemy") or self._enemy_name
		end

		local unit = safe_spawn_unit(enemy_name, self:get_orientation())

		unit:base():add_destroy_listener(self._unit_destroy_clbk_key, callback(self, self, "clbk_unit_destroyed"))

		unit:unit_data().mission_element = self
		local objective = nil
		local action = self._create_action_data(CopActionAct._act_redirects.enemy_spawn[self._values.spawn_action])
		local stance = managers.groupai:state():enemy_weapons_hot() and "cbt" or "ntl"

		if action.type == "act" then
			objective = {
				type = "act",
				action = action,
				stance = stance
			}
		end

		local spawn_ai = {
			init_state = "idle",
			objective = objective
		}

		unit:brain():set_spawn_ai(spawn_ai)

		local team_id = params and params.team or self._values.team or tweak_data.levels:get_default_team_ID(unit:base():char_tweak().access == "gangster" and "gangster" or "combatant")

		if self._values.participate_to_group_ai then
			managers.groupai:state():assign_enemy_to_group_ai(unit, team_id)
		else
			managers.groupai:state():set_char_team(unit, team_id)
		end

		if self._values.voice then
			unit:sound():set_voice_prefix(self._values.voice)
		end

		table.insert(self._units, unit)
		self:event("spawn", unit)

		if self._values.force_pickup and self._values.force_pickup ~= "none" then
			local pickup_name = self._values.force_pickup ~= "no_pickup" and self._values.force_pickup or nil

			unit:character_damage():set_pickup(pickup_name)
		end
	end

	return self._units[#self._units]
end