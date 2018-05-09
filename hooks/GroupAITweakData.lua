Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "zm_allow_clk_dozers", function(self, difficulty_index)
    self.special_unit_spawn_limits = {
        shield = 3,
        medic = 5,
        taser = 5,
        tank = 5,
        spooc = 5
    }
end)