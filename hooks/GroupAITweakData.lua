Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "zm_allow_clk_dozers", function(self, difficulty_index)
    self.special_unit_spawn_limits = {
        shield = 0,
        medic = 0,
        taser = 3,
        tank = 3,
        spooc = 3
    }
end)