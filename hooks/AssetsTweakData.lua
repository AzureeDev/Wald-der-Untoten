Hooks:PostHook(AssetsTweakData, "_init_assets", "zm_init_assets", function(self, tweak_data)
    self.zm_wald_der_untoten_perks = {
		name_id = "zm_wald_der_untoten_perks_name",
		texture = "map_assets/perks",
		stages = {"zm_the_forest"},
		no_mystery = true
	}
    self.zm_wald_der_untoten_perks_2 = {
		name_id = "zm_wald_der_untoten_perks_2_name",
		texture = "map_assets/perks_2",
		stages = {"zm_the_forest"},
		no_mystery = true
	}
end)