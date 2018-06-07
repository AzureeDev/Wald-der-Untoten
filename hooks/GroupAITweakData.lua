Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "zm_allow_clk_dozers", function(self, difficulty_index)
    local access_type_walk_only = {walk = true}
	local access_type_all = {
		acrobatic = true,
		walk = true
    }
    
    self.special_unit_spawn_limits = {
        shield = 4,
        medic = 3,
        taser = 2,
        tank = 8,
        spooc = 16
    }

    self.unit_categories.hdl_tank = {
        special_type = "tank",
        unit_types = {
            america = {Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween")},
            russia = {Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween")},
            zombie = {Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween")}
        },
        access = access_type_all
    }
end)

Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups", "zm_new_group", function(self, difficulty_index)
    self.enemy_spawn_groups.single_hdl_tank = {
		amount = {
			1,
			1
		},
		spawn = {{
			freq = 3,
            amount_min = 1,
            amount_max = 4,
			rank = 3,
			unit = "hdl_tank",
			tactics = self._tactics.tank_rush
		}}
    }
end)

Hooks:PostHook(GroupAITweakData, "_init_task_data", "zm_init_task_data", function(self)
    local hdl_bdz = {
        single_hdl_tank = {
            0.13,
            0.13,
            0.13
        }
    }

    self.besiege.assault.force = {
        48,
        52,
        56
    }

    self.besiege.assault.force_balance_mul = {
        1,
        1,
        1,
        1
    }

    table.insert(self.besiege.assault.groups, hdl_bdz)
end)