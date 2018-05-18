Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "zm_allow_clk_dozers", function(self, difficulty_index)
    local access_type_walk_only = {walk = true}
	local access_type_all = {
		acrobatic = true,
		walk = true
    }
    
    self.special_unit_spawn_limits = {
        shield = 0,
        medic = 5,
        taser = 5,
        tank = 5,
        spooc = 5
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
			freq = 1,
            amount_min = 1,
            amount_max = 4,
			rank = 3,
			unit = "hdl_tank",
			tactics = self._tactics.tank_rush
		}}
	}
end)