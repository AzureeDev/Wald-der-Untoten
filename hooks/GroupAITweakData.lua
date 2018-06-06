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
    self.enemy_spawn_groups.tac_swat_shotgun_rush = {
        amount = {
            3,
            3
        },
        spawn = {
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 2,
                unit = "CS_swat_R870",
                tactics = self._tactics.tank_rush
            },
            {
                amount_min = 1,
                freq = 1,
                amount_max = 1,
                rank = 3,
                unit = "CS_heavy_R870",
                tactics = self._tactics.tank_rush
            }
        }
    }

    self.enemy_spawn_groups.tac_swat_shotgun_flank = {
        amount = {
            3,
            3
        },
        spawn = {
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 2,
                unit = "CS_swat_R870",
                tactics = self._tactics.tank_rush
            },
            {
                amount_min = 1,
                freq = 1,
                amount_max = 1,
                rank = 3,
                unit = "CS_heavy_R870",
                tactics = self._tactics.tank_rush
            }
        }
    }

    self.enemy_spawn_groups.tac_swat_rifle = {
        amount = {
            3,
            3
        },
        spawn = {
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 2,
                unit = "CS_swat_MP5",
                tactics = self._tactics.tank_rush
            },
            {
                amount_min = 1,
                freq = 1,
                amount_max = 1,
                rank = 3,
                unit = "CS_heavy_M4",
                tactics = self._tactics.tank_rush
            }
        }
    }

    self.enemy_spawn_groups.tac_swat_rifle_flank = {
        amount = {
            3,
            3
        },
        spawn = {
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 2,
                unit = "CS_swat_MP5",
                tactics = self._tactics.tank_rush
            },
            {
                amount_min = 1,
                freq = 1,
                amount_max = 1,
                rank = 3,
                unit = "CS_heavy_M4",
                tactics = self._tactics.tank_rush
            }
        }
    }

    self.enemy_spawn_groups.tac_shield_wall_ranged = {
        amount = {
            4,
            4
        },
        spawn = {
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 2,
                unit = "CS_swat_MP5",
                tactics = self._tactics.tank_rush
            },
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 3,
                unit = "CS_shield",
                tactics = self._tactics.tank_rush
            }
        }
    }

    self.enemy_spawn_groups.tac_shield_wall_charge = {
        amount = {
            4,
            4
        },
        spawn = {
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 2,
                unit = "CS_swat_R870",
                tactics = self._tactics.tank_rush
            },
            {
                amount_min = 2,
                freq = 1,
                amount_max = 2,
                rank = 3,
                unit = "CS_shield",
                tactics = self._tactics.tank_rush
            }
        }
    }

    self.enemy_spawn_groups.tac_shield_wall = {
        amount = {
            4,
            4
        },
        spawn = {{
            amount_min = 4,
            freq = 1,
            amount_max = 4,
            rank = 3,
            unit = "FBI_shield",
            tactics = self._tactics.tank_rush
        }}
    }

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

    self.enemy_spawn_groups.tac_tazer_flanking = {
        amount = {
            1,
            1
        },
        spawn = {{
            amount_min = 1,
            freq = 1,
            amount_max = 1,
            rank = 3,
            unit = "CS_tazer",
            tactics = self._tactics.tank_rush
        }}
    }

    self.enemy_spawn_groups.tac_tazer_charge = {
        amount = {
            1,
            1
        },
        spawn = {{
            amount_min = 1,
            freq = 1,
            amount_max = 1,
            rank = 3,
            unit = "CS_tazer",
            tactics = self._tactics.tank_rush
        }}
    }

    self.enemy_spawn_groups.single_spooc = {
		amount = {
			1,
			1
		},
		spawn = {{
			freq = 1,
			amount_min = 1,
			rank = 1,
			unit = "spooc",
			tactics = self._tactics.tank_rush
		}}
	}
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
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