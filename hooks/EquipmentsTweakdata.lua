Hooks:PostHook(EquipmentsTweakData, "init", "init_zm_perks", function(self)
    self.specials.zm_power_on = {
        sync_possession = true,
		icon = "zm_power_on",
		text_id = "hud_zm_power_on"
    }
    self.specials.perk_juggernog = {
        sync_possession = true,
		icon = "perk_juggernog",
		text_id = "hud_perk_juggernog"
    }
    self.specials.perk_speedcola = {
        sync_possession = true,
		icon = "perk_speedcola",
		text_id = "hud_perk_speedcola"
    }
    self.specials.perk_doubletap = {
        sync_possession = true,
		icon = "perk_doubletap",
		text_id = "hud_perk_doubletap"
    }
    self.specials.perk_quickrevive = {
        sync_possession = true,
		icon = "perk_quickrevive",
		text_id = "hud_perk_quickrevive"
    }
    self.specials.perk_deadshot = {
        sync_possession = true,
		icon = "perk_deadshot",
		text_id = "hud_perk_deadshot"
    }
end)