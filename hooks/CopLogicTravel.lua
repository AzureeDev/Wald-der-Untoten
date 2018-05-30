local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
CopLogicTravel.damage_clbk = CopLogicIdle.damage_clbk
CopLogicTravel.death_clbk = CopLogicAttack.death_clbk
CopLogicTravel.on_detected_enemy_destroyed = CopLogicAttack.on_detected_enemy_destroyed
CopLogicTravel.on_criminal_neutralized = CopLogicAttack.on_criminal_neutralized
CopLogicTravel.on_alert = CopLogicIdle.on_alert
CopLogicTravel.on_new_objective = CopLogicIdle.on_new_objective

function CopLogicTravel._chk_begin_advance(data, my_data)
	if data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	local objective = data.objective
	local haste = "run"
    local pose = "stand"
    
	if not data.unit:anim_data()[pose] then
		CopLogicAttack["_chk_request_action_" .. pose](data)
	end

	local end_rot = nil

	if #my_data.coarse_path - 1 <= my_data.coarse_path_index then
		end_rot = objective and objective.rot
	end

	local no_strafe, end_pose = nil

	if my_data.moving_to_cover and (not data.char_tweak.allowed_poses or data.char_tweak.allowed_poses.crouch) then
		end_pose = "stand"
	end

	CopLogicTravel._chk_request_action_walk_to_advance_pos(data, my_data, haste, end_rot, no_strafe, pose, end_pose)
end

function CopLogicTravel._find_cover(data, search_nav_seg, near_pos)
	local cover = nil
	local search_area = managers.groupai:state():get_area_from_nav_seg_id(search_nav_seg)

	if data.unit:movement():cool() then
		cover = managers.navigation:find_cover_in_nav_seg_1(search_area.nav_segs)
	else
        local optimal_threat_dis, threat_pos = nil
        optimal_threat_dis = 1
		near_pos = near_pos or search_area.pos
		local all_criminals = managers.groupai:state():all_char_criminals()
		local closest_crim_u_data, closest_crim_dis = nil

		for u_key, u_data in pairs(all_criminals) do
			local crim_area = managers.groupai:state():get_area_from_nav_seg_id(u_data.tracker:nav_segment())

			if crim_area == search_area then
				threat_pos = u_data.m_pos

				break
			else
				local crim_dis = mvector3.distance_sq(near_pos, u_data.m_pos)

				if not closest_crim_dis or crim_dis < closest_crim_dis then
					threat_pos = u_data.m_pos
					closest_crim_dis = crim_dis
				end
			end
		end

		cover = managers.navigation:find_cover_from_threat(search_area.nav_segs, optimal_threat_dis, near_pos, threat_pos)
	end

	return cover
end

function CopLogicTravel._get_pos_accross_door(guard_door, nav_seg)
	local rooms = guard_door.rooms
	local room_1_seg = guard_door.low_seg
	local accross_vec = guard_door.high_pos - guard_door.low_pos
	local rot_angle = 90

	if room_1_seg == nav_seg then
		if guard_door.low_pos.y == guard_door.high_pos.y then
			rot_angle = rot_angle * -1
		end
	elseif guard_door.low_pos.x == guard_door.high_pos.x then
		rot_angle = rot_angle * -1
	end

	mvector3.rotate_with(accross_vec, Rotation(rot_angle))

	local max_dis = 1

	mvector3.set_length(accross_vec, 1)

	local door_pos = guard_door.center
	local door_tracker = managers.navigation:create_nav_tracker(mvector3.copy(door_pos))
	local accross_positions = managers.navigation:find_walls_accross_tracker(door_tracker, accross_vec)

	if accross_positions then
		local optimal_dis = math.lerp(max_dis * 0.6, max_dis, math.random())
		local best_error_dis, best_pos, best_is_hit, best_is_miss, best_has_too_much_error = nil

		for _, accross_pos in ipairs(accross_positions) do
			local error_dis = math.abs(mvector3.distance(accross_pos[1], door_pos) - optimal_dis)
			local too_much_error = error_dis / optimal_dis > 0.3
			local is_hit = accross_pos[2]

			if best_is_hit then
				if is_hit then
					if error_dis < best_error_dis then
						best_pos = accross_pos[1]
						best_error_dis = error_dis
						best_has_too_much_error = too_much_error
					end
				elseif best_has_too_much_error then
					best_pos = accross_pos[1]
					best_error_dis = error_dis
					best_is_miss = true
					best_is_hit = nil
				end
			elseif best_is_miss then
				if not too_much_error then
					best_pos = accross_pos[1]
					best_error_dis = error_dis
					best_has_too_much_error = nil
					best_is_miss = nil
					best_is_hit = true
				end
			else
				best_pos = accross_pos[1]
				best_is_hit = is_hit
				best_is_miss = not is_hit
				best_has_too_much_error = too_much_error
				best_error_dis = error_dis
			end
		end

		managers.navigation:destroy_nav_tracker(door_tracker)

		return best_pos
	end

	managers.navigation:destroy_nav_tracker(door_tracker)
end

function CopLogicTravel.action_complete_clbk(data, action)
	local my_data = data.internal_data
	local action_type = action:type()

	if action_type == "walk" then
		if action:expired() and not my_data.starting_advance_action and my_data.coarse_path_index and not my_data.has_old_action and my_data.advancing then
			my_data.coarse_path_index = my_data.coarse_path_index + 1

			if #my_data.coarse_path < my_data.coarse_path_index then
				debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] invalid coarse path index increment", data.unit, inspect(my_data.coarse_path), my_data.coarse_path_index)

				my_data.coarse_path_index = my_data.coarse_path_index - 1
			end
		end

		my_data.advancing = nil

		if my_data.moving_to_cover then
			if action:expired() then
				if my_data.best_cover then
					managers.navigation:release_cover(my_data.best_cover[1])
				end

				my_data.best_cover = my_data.moving_to_cover

				CopLogicBase.chk_cancel_delayed_clbk(my_data, my_data.cover_update_task_key)

				local high_ray = CopLogicTravel._chk_cover_height(data, my_data.best_cover[1], data.visibility_slotmask)
				my_data.best_cover[4] = high_ray
				my_data.in_cover = true
				local cover_wait_time = 0.1

				if not CopLogicTravel._chk_close_to_criminal(data, my_data) then
					cover_wait_time = 0
				end

				my_data.cover_leave_t = data.t + cover_wait_time
			else
				managers.navigation:release_cover(my_data.moving_to_cover[1])

				if my_data.best_cover then
					local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())

					if dis > 1 then
						managers.navigation:release_cover(my_data.best_cover[1])

						my_data.best_cover = nil
					end
				end
			end

			my_data.moving_to_cover = nil
		elseif my_data.best_cover then
			local dis = mvector3.distance(my_data.best_cover[1][1], data.unit:movement():m_pos())

			if dis > 1 then
				managers.navigation:release_cover(my_data.best_cover[1])

				my_data.best_cover = nil
			end
		end

		if not action:expired() then
			if my_data.processing_advance_path then
				local pathing_results = data.pathing_results

				if pathing_results and pathing_results[my_data.advance_path_search_id] then
					data.pathing_results[my_data.advance_path_search_id] = nil
					my_data.processing_advance_path = nil
				end
			elseif my_data.advance_path then
				my_data.advance_path = nil
			end

			data.unit:brain():abort_detailed_pathing(my_data.advance_path_search_id)
		end
	elseif action_type == "turn" then
		data.internal_data.turning = nil
	elseif action_type == "shoot" then
		data.internal_data.shooting = nil
	elseif action_type == "dodge" then
		local objective = data.objective
		local allow_trans, obj_failed = CopLogicBase.is_obstructed(data, objective, nil, nil)

		if allow_trans then
			local wanted_state = data.logic._get_logic_state_from_reaction(data)

			if wanted_state and wanted_state ~= data.name and obj_failed then
				if data.unit:in_slot(managers.slot:get_mask("enemies")) or data.unit:in_slot(17) then
					data.objective_failed_clbk(data.unit, data.objective)
				elseif data.unit:in_slot(managers.slot:get_mask("criminals")) then
					managers.groupai:state():on_criminal_objective_failed(data.unit, data.objective, false)
				end

				if my_data == data.internal_data then
					debug_pause_unit(data.unit, "[CopLogicTravel.action_complete_clbk] exiting without discarding objective", data.unit, inspect(data.objective))
					CopLogicBase._exit(data.unit, wanted_state)
				end
			end
		end
	end
end

function CopLogicTravel._update_cover(ignore_this, data)
	local my_data = data.internal_data

	CopLogicBase.on_delayed_clbk(my_data, my_data.cover_update_task_key)

	local cover_release_dis = 1
	local nearest_cover = my_data.nearest_cover
	local best_cover = my_data.best_cover
	local m_pos = data.m_pos

	if not my_data.in_cover and nearest_cover and cover_release_dis < mvector3.distance(nearest_cover[1][1], m_pos) then
		managers.navigation:release_cover(nearest_cover[1])

		my_data.nearest_cover = nil
		nearest_cover = nil
	end

	if best_cover and cover_release_dis < mvector3.distance(best_cover[1][1], m_pos) then
		managers.navigation:release_cover(best_cover[1])

		my_data.best_cover = nil
		best_cover = nil
	end

	if nearest_cover or best_cover then
		CopLogicBase.add_delayed_clbk(my_data, my_data.cover_update_task_key, callback(CopLogicTravel, CopLogicTravel, "_update_cover", data), data.t + 1)
	end
end