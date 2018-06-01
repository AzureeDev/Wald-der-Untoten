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

Hooks:PostHook(AssetsTweakData, "_init_risk_assets", "zm_ignore_risk_asset", function(self, tweak_data)
    table.insert(self.risk_pd.exclude_stages, "zm_the_forest")
    table.insert(self.risk_swat.exclude_stages, "zm_the_forest")
    table.insert(self.risk_fbi.exclude_stages, "zm_the_forest")
    table.insert(self.risk_death_squad.exclude_stages, "zm_the_forest")
    table.insert(self.risk_easy_wish.exclude_stages, "zm_the_forest")
    table.insert(self.risk_death_wish.exclude_stages, "zm_the_forest")
    table.insert(self.risk_sm_wish.exclude_stages, "zm_the_forest")
end)

Hooks:PostHook(AssetsTweakData, "_init_gage_assets", "zm_ignore_gage_asset", function(self, tweak_data)
    table.insert(self.gage_assignment.exclude_stages, "zm_the_forest")
end)