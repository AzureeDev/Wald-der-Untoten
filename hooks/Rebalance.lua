Hooks:PostHook( HUDManager, "init", "zm_rebalance", function(self)
    tweak_data.weapon.colt_1911_secondary.name_id = "wpn_m1911_name"  
    tweak_data.weapon.colt_1911_secondary.CLIP_AMMO_MAX = 7
    tweak_data.weapon.colt_1911_secondary.NR_CLIPS_MAX = 6
    tweak_data.weapon.colt_1911_secondary.stats.total_ammo_mod = 8
    tweak_data.weapon.colt_1911_secondary.stats.damage = 130
end)
