Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "zm_allow_clk_dozers", function(self, difficulty_index)
    local access_type_walk_only = {walk = true}
	local access_type_all = {
		acrobatic = true,
		walk = true
    }
    
    self.special_unit_spawn_limits = {
        shield = 1,
        medic = 3,
        taser = 2,
        tank = 3,
        spooc = 4
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
			freq = 6,
            amount_min = 1,
            amount_max = 4,
			rank = 3,
			unit = "hdl_tank",
			tactics = self._tactics.tank_rush
		}}
    }
    
    self.enemy_spawn_groups.tac_bull_rush = {
        amount = {
            3,
            3
        },
        spawn = {{
            amount_min = 6,
            freq = 6,
            amount_max = 6,
            rank = 3,
            unit = "FBI_tank",
            tactics = self._tactics.tank_rush
        }}
    }

    self.enemy_spawn_groups.single_spooc = {
		amount = {
			3,
			3
		},
		spawn = {{
			freq = 6,
            amount_min = 6,
            amount_max = 6,
			rank = 1,
			unit = "spooc",
			tactics = self._tactics.spooc
		}}
    }
    self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
end)

Hooks:PostHook(GroupAITweakData, "_init_task_data", "zm_init_task_data", function(self)
    self.besiege.assault.groups = {
        tac_swat_shotgun_rush = {
            0.13,
            0.13,
            0.13
        },
        tac_swat_shotgun_flank = {
            0.13,
            0.13,
            0.13
        },
        tac_swat_rifle = {
            0.13,
            0.13,
            0.13
        },
        tac_swat_rifle_flank = {
            0.13,
            0.13,
            0.13
        },
        tac_shield_wall_ranged = {
            0.06,
            0.06,
            0.06
        },
        tac_shield_wall_charge = {
            0.05,
            0.05,
            0.05
        },
        tac_shield_wall = {
            0.05,
            0.05,
            0.05
        },
        tac_tazer_flanking = {
            0.09,
            0.09,
            0.09
        },
        tac_tazer_charge = {
            0.09,
            0.09,
            0.09
        },
        FBI_spoocs = {
            0.13,
            0.13,
            0.13
        },
        tac_bull_rush = {
            0.13,
            0.13,
            0.13
        },
        single_hdl_tank = {
            0.09,
            0.09,
            0.09
        }
    }
end)