local PRIMARY = 2
local SECONDARY = 1

Hooks:PostHook(WeaponTweakData, "_init_new_weapons", "zm_init_new_weapons", function(self, weapon_data)
    self.nothing2_primary = deep_clone(self.m134)
    self.nothing2_primary.AMMO_PICKUP = {0, 0}
    self.nothing2_primary.timers.reload_not_empty = 0
    self.nothing2_primary.timers.reload_empty = 0
    self.nothing2_primary.timers.unequip = 0
    self.nothing2_primary.timers.equip = 0
    self.nothing2_primary.CLIP_AMMO_MAX = 0
    self.nothing2_primary.NR_CLIPS_MAX = 1
    self.nothing2_primary.fire_mode_data = {fire_rate = 10000}
    self.nothing2_primary.sounds.fire = nil
    self.nothing2_primary.sounds.fire_single = nil
    self.nothing2_primary.sounds.fire_auto = nil
    self.nothing2_primary.sounds.dryfire = nil
    self.nothing2_primary.sounds.enter_steelsight = nil
    self.nothing2_primary.sounds.leave_steelsight = nil
    self.nothing2_primary.stats = {
        zoom = 1,
		total_ammo_mod = 1,
		damage = 0,
		alert_size = 7,
		spread = 0,
		spread_moving = 0,
		recoil = 0,
		value = 1,
		extra_ammo = 51,
		reload = 11,
		suppression = 5,
		concealment = 30
    }

    self.wunderwaffe_primary = deep_clone(self.wa2000)
    self.wunderwaffe_primary.name_id = "wpn_waffe_name"
    self.wunderwaffe_primary.AMMO_PICKUP = {0, 0}
    self.wunderwaffe_primary.CLIP_AMMO_MAX = 3
    self.wunderwaffe_primary.NR_CLIPS_MAX = 6
    self.wunderwaffe_primary.AMMO_MAX = self.wunderwaffe_primary.CLIP_AMMO_MAX * self.wunderwaffe_primary.NR_CLIPS_MAX
    self.wunderwaffe_primary.FIRE_MODE = "single"
    self.wunderwaffe_primary.CAN_TOGGLE_FIREMODE = false
    self.wunderwaffe_primary.single = {fire_rate = 1}
    self.wunderwaffe_primary.fire_mode_data = {fire_rate = 1}
    self.wunderwaffe_primary.stats_modifiers = {damage = 1500}
    self.wunderwaffe_primary.muzzleflash = "effects/particles/weapons/wunder_fire"
    self.wunderwaffe_primary.shell_ejection = "effects/payday2/particles/weapons/shells/shell_empty"
    self.wunderwaffe_primary.sounds.fire = "wunderwaffe_fire"
    self.wunderwaffe_primary.sounds.fire_single = "wunderwaffe_fire"
    self.wunderwaffe_primary.sounds.dryfire = nil
    self.wunderwaffe_primary.timers = {
		reload_not_empty = 6,
		reload_empty = 6,
		unequip = 1,
		equip = 1
	}
    self.wunderwaffe_primary.animations.reload_name_id = "wa2000"
    self.wunderwaffe_primary.weapon_hold = "wa2000"
    self.wunderwaffe_primary.can_shoot_through_wall = false
    self.wunderwaffe_primary.can_shoot_through_enemy = false

    self.wunderwaffe_secondary = deep_clone(self.wunderwaffe_primary)
    self.wunderwaffe_secondary.use_data = {selection_index = 1}

    self.wunderwaffe_dg3_primary = deep_clone(self.wunderwaffe_primary)
    self.wunderwaffe_dg3_primary.name_id = "wpn_waffe_upg_name"
    self.wunderwaffe_dg3_primary.CLIP_AMMO_MAX = 6
    self.wunderwaffe_dg3_primary.muzzleflash = "effects/particles/weapons/wunder_dg3_fire"
    self.wunderwaffe_dg3_primary.NR_CLIPS_MAX = 6
    self.wunderwaffe_dg3_primary.AMMO_MAX = self.wunderwaffe_dg3_primary.CLIP_AMMO_MAX * self.wunderwaffe_dg3_primary.NR_CLIPS_MAX
    self.wunderwaffe_dg3_primary.timers = {
		reload_not_empty = 4.7,
		reload_empty = 4.7,
		unequip = 1,
		equip = 1
	}
    self.wunderwaffe_dg3_secondary = deep_clone(self.wunderwaffe_dg3_primary)
    self.wunderwaffe_dg3_secondary.use_data = {selection_index = 1}

    self:_init_zm_new_weapons()
end)

function WeaponTweakData:_init_zm_new_weapons()
    self.colt_1911_primary = deep_clone(self.colt_1911)
    self.colt_1911_primary.name_id = "wpn_m1911_name"
    self.colt_1911_primary.animations.reload_name_id = "colt_1911"
    self.colt_1911_primary.weapon_hold = "colt_1911"
    self.colt_1911_primary.CLIP_AMMO_MAX = 7
    self.colt_1911_primary.NR_CLIPS_MAX = 6
    self.colt_1911_primary.AMMO_MAX = self.colt_1911_primary.CLIP_AMMO_MAX * self.colt_1911_primary.NR_CLIPS_MAX
    self.colt_1911.stats.damage = 80
    self.colt_1911_primary.use_data = {selection_index = PRIMARY}
    self.colt_1911_secondary = deep_clone(self.colt_1911_primary)
    self.colt_1911_secondary.use_data = {selection_index = SECONDARY}

    self.new_m14_primary = deep_clone(self.new_m14)
    self.new_m14_primary.animations.reload_name_id = "new_m14"
    self.new_m14_primary.weapon_hold = "new_m14"
    self.new_m14_primary.stats_modifiers = {damage = 2}
    self.new_m14_secondary = deep_clone(self.new_m14_primary)
    self.new_m14_secondary.use_data = {selection_index = SECONDARY}

    self.b682_primary = deep_clone(self.b682)
    self.b682_primary.animations.reload_name_id = "b682"
    self.b682_primary.weapon_hold = "b682"
    self.b682_primary.stats_modifiers = {damage = 2}
    self.b682_primary.NR_CLIPS_MAX = self.b682_primary.NR_CLIPS_MAX * 2
    self.b682_primary.AMMO_MAX = self.b682_primary.CLIP_AMMO_MAX * self.b682_primary.NR_CLIPS_MAX
    self.b682_secondary = deep_clone(self.b682_primary)
    self.b682_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.mp9_primary = deep_clone(self.mp9)
    self.mp9_primary.animations.reload_name_id = "mp9"
    self.mp9_primary.weapon_hold = "mp9"
    self.mp9_primary.stats_modifiers = {damage = 2}
    self.mp9_primary.use_data = {selection_index = PRIMARY}
    self.mp9_secondary = deep_clone(self.mp9_primary)
    self.mp9_secondary.use_data = {selection_index = SECONDARY}

    self.m95_primary = deep_clone(self.m95)
    self.m95_primary.animations.reload_name_id = "m95"
    self.m95_primary.weapon_hold = "m95"
    self.m95_primary.NR_CLIPS_MAX = self.m95_primary.NR_CLIPS_MAX * 2
    self.m95_primary.AMMO_MAX = self.m95_primary.CLIP_AMMO_MAX * self.m95_primary.NR_CLIPS_MAX
    self.m95_primary.stats_modifiers = {damage = 50}
    self.m95_secondary = deep_clone(self.m95_primary)
    self.m95_secondary.use_data = {selection_index = SECONDARY}
	
	
--ENTERING A WORLD OF PAIN AND SUFFERING
    self.amcar_primary = deep_clone(self.amcar)
    self.amcar_primary.animations.reload_name_id = "amcar"
    self.amcar_primary.weapon_hold = "m4"
    self.amcar_primary.stats_modifiers = {damage = 2}
    self.amcar_secondary = deep_clone(self.amcar_primary)
    self.amcar_secondary.use_data = {selection_index = SECONDARY}
	
    self.aug_primary = deep_clone(self.aug)
    self.aug_primary.animations.reload_name_id = "aug"
    self.aug_primary.weapon_hold = "aug"
    self.aug_primary.NR_CLIPS_MAX = self.aug_primary.NR_CLIPS_MAX * 2
    self.aug_primary.stats_modifiers = {damage = 2}
    self.aug_primary.AMMO_MAX = self.aug_primary.CLIP_AMMO_MAX * self.aug_primary.NR_CLIPS_MAX
    self.aug_secondary = deep_clone(self.aug_primary)
    self.aug_secondary.use_data = {selection_index = SECONDARY}
	
    self.fal_primary = deep_clone(self.fal)
    self.fal_primary.animations.reload_name_id = "fal"
    self.fal_primary.weapon_hold = "fal"
    self.fal_primary.stats_modifiers = {damage = 2}
    self.fal_primary.NR_CLIPS_MAX = self.fal_primary.NR_CLIPS_MAX * 2
    self.fal_primary.AMMO_MAX = self.fal_primary.CLIP_AMMO_MAX * self.fal_primary.NR_CLIPS_MAX
    self.fal_secondary = deep_clone(self.fal_primary)
    self.fal_secondary.use_data = {selection_index = SECONDARY}
	
    self.flint_primary = deep_clone(self.flint)
    self.flint_primary.animations.reload_name_id = "flint"
    self.flint_primary.weapon_hold = "flint"
    self.flint_primary.stats_modifiers = {damage = 2}
    self.flint_primary.NR_CLIPS_MAX = self.flint_primary.NR_CLIPS_MAX * 3
    self.flint_primary.AMMO_MAX = self.flint_primary.CLIP_AMMO_MAX * self.flint_primary.NR_CLIPS_MAX
    self.flint_secondary = deep_clone(self.flint_primary)
    self.flint_secondary.use_data = {selection_index = SECONDARY}
	
    self.m16_primary = deep_clone(self.m16)
    self.m16_primary.animations.reload_name_id = "m16"
    self.m16_primary.weapon_hold = "m4"
    self.m16_primary.stats_modifiers = {damage = 2}
    self.m16_primary.NR_CLIPS_MAX = self.m16_primary.NR_CLIPS_MAX * 3
    self.m16_primary.AMMO_MAX = self.m16_primary.CLIP_AMMO_MAX * self.m16_primary.NR_CLIPS_MAX
    self.m16_secondary = deep_clone(self.m16_primary)
    self.m16_secondary.use_data = {selection_index = SECONDARY}
	
    self.scar_primary = deep_clone(self.scar)
    self.scar_primary.animations.reload_name_id = "scar"
    self.scar_primary.weapon_hold = "m4"
    self.scar_primary.stats_modifiers = {damage = 2}
    self.scar_primary.NR_CLIPS_MAX = self.scar_primary.NR_CLIPS_MAX * 2
    self.scar_primary.AMMO_MAX = self.scar_primary.CLIP_AMMO_MAX * self.scar_primary.NR_CLIPS_MAX
    self.scar_secondary = deep_clone(self.scar_primary)
    self.scar_secondary.use_data = {selection_index = SECONDARY}
	
    self.hk21_primary = deep_clone(self.hk21)
    self.hk21_primary.animations.reload_name_id = "hk21"
    self.hk21_primary.weapon_hold = "hk21"
    self.hk21_primary.stats_modifiers = {damage = 2}
    self.hk21_secondary = deep_clone(self.hk21_primary)
    self.hk21_secondary.use_data = {selection_index = SECONDARY}
	
    self.m249_primary = deep_clone(self.m249)
    self.m249_primary.animations.reload_name_id = "m249"
    self.m249_primary.weapon_hold = "m249"
    self.m249_primary.stats_modifiers = {damage = 2}
    self.m249_secondary = deep_clone(self.m249_primary)
    self.m249_secondary.use_data = {selection_index = SECONDARY}
	
    self.breech_primary = deep_clone(self.breech)
    self.breech_primary.animations.reload_name_id = "breech"
    self.breech_primary.weapon_hold = "breech"
    self.breech_primary.stats_modifiers = {damage = 2}
    self.breech_primary.NR_CLIPS_MAX = self.breech_primary.NR_CLIPS_MAX * 2
    self.breech_primary.AMMO_MAX = self.breech_primary.CLIP_AMMO_MAX * self.breech_primary.NR_CLIPS_MAX
    self.breech_primary.use_data = {selection_index = PRIMARY}
    self.breech_secondary = deep_clone(self.breech_primary)
    self.breech_secondary.use_data = {selection_index = SECONDARY}
	
    self.deagle_primary = deep_clone(self.deagle)
    self.deagle_primary.animations.reload_name_id = "deagle"
    self.deagle_primary.weapon_hold = "deagle"
    self.deagle_primary.stats_modifiers = {damage = 2}
    self.deagle_primary.NR_CLIPS_MAX = self.deagle_primary.NR_CLIPS_MAX * 2
    self.deagle_primary.AMMO_MAX = self.deagle_primary.CLIP_AMMO_MAX * self.deagle_primary.NR_CLIPS_MAX
    self.deagle_primary.use_data = {selection_index = PRIMARY}
    self.deagle_secondary = deep_clone(self.deagle_primary)
    self.deagle_secondary.use_data = {selection_index = SECONDARY}
	
    self.judge_primary = deep_clone(self.judge)
    self.judge_primary.animations.reload_name_id = "judge"
    self.judge_primary.weapon_hold = "raging_bull"
    self.judge_primary.stats_modifiers = {damage = 2}
    self.judge_primary.NR_CLIPS_MAX = self.judge_primary.NR_CLIPS_MAX * 2
    self.judge_primary.AMMO_MAX = self.judge_primary.CLIP_AMMO_MAX * self.judge_primary.NR_CLIPS_MAX
    self.judge_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.judge_secondary = deep_clone(self.judge_primary)
    self.judge_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.peacemaker_primary = deep_clone(self.peacemaker)
    self.peacemaker_primary.animations.reload_name_id = "peacemaker"
    self.peacemaker_primary.weapon_hold = "peacemaker"
    self.peacemaker_primary.NR_CLIPS_MAX = self.peacemaker_primary.NR_CLIPS_MAX
    self.peacemaker_primary.AMMO_MAX = self.peacemaker_primary.CLIP_AMMO_MAX * self.peacemaker_primary.NR_CLIPS_MAX
    self.peacemaker_primary.use_data = {selection_index = PRIMARY}    
    self.peacemaker_primary.stats_modifiers = {damage = 2} -- it was 1 before; wtf?
    self.peacemaker_secondary = deep_clone(self.peacemaker_primary)
    self.peacemaker_secondary.use_data = {selection_index = SECONDARY}

    self.new_raging_bull_primary = deep_clone(self.new_raging_bull)
    self.new_raging_bull_primary.animations.reload_name_id = "raging_bull"
    self.new_raging_bull_primary.weapon_hold = "raging_bull"
    self.new_raging_bull_primary.stats_modifiers = {damage = 2}
    self.new_raging_bull_primary.NR_CLIPS_MAX = self.new_raging_bull_primary.NR_CLIPS_MAX
    self.new_raging_bull_primary.AMMO_MAX = self.new_raging_bull_primary.CLIP_AMMO_MAX * self.new_raging_bull_primary.NR_CLIPS_MAX
    self.new_raging_bull_primary.use_data = {selection_index = PRIMARY}    
    self.new_raging_bull_secondary = deep_clone(self.new_raging_bull_primary)
    self.new_raging_bull_secondary.use_data = {selection_index = SECONDARY}
	
    self.striker_primary = deep_clone(self.striker)
    self.striker_primary.animations.reload_name_id = "striker"
    self.striker_primary.weapon_hold = "striker"
    self.striker_primary.NR_CLIPS_MAX = self.striker_primary.NR_CLIPS_MAX
    self.striker_primary.AMMO_MAX = self.striker_primary.CLIP_AMMO_MAX * self.striker_primary.NR_CLIPS_MAX
    self.striker_primary.stats.damage = 120
    self.striker_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.striker_secondary = deep_clone(self.striker_primary)
    self.striker_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}
	
    self.p90_primary = deep_clone(self.p90)
    self.p90_primary.animations.reload_name_id = "p90"
    self.p90_primary.weapon_hold = "p90"
    self.p90_primary.stats_modifiers = {damage = 2}
    self.p90_primary.NR_CLIPS_MAX = self.p90_primary.NR_CLIPS_MAX * 2
    self.p90_primary.AMMO_MAX = self.p90_primary.CLIP_AMMO_MAX * self.p90_primary.NR_CLIPS_MAX
    self.p90_primary.use_data = {selection_index = PRIMARY}
    self.p90_secondary = deep_clone(self.p90_primary)
    self.p90_secondary.use_data = {selection_index = SECONDARY}
	
    self.m1928_primary = deep_clone(self.m1928)
    self.m1928_primary.animations.reload_name_id = "m1928"
    self.m1928_primary.weapon_hold = "tommy"
    self.m1928_primary.stats_modifiers = {damage = 2}
    self.m1928_primary.NR_CLIPS_MAX = self.m1928_primary.NR_CLIPS_MAX * 2
    self.m1928_primary.AMMO_MAX = self.m1928_primary.CLIP_AMMO_MAX * self.m1928_primary.NR_CLIPS_MAX
    self.m1928_primary.use_data = {selection_index = PRIMARY}
    self.m1928_secondary = deep_clone(self.m1928_primary)
    self.m1928_secondary.use_data = {selection_index = SECONDARY}

    -- Nepgear best waifu

    self.rpg7_primary = deep_clone(self.rpg7)
    self.rpg7_primary.animations.reload_name_id = "rpg7"
    self.rpg7_primary.weapon_hold = "rpg7"
    self.rpg7_primary.stats_modifiers = {damage = 2}
    self.rpg7_primary.CLIP_AMMO_MAX = 1
	self.rpg7_primary.NR_CLIPS_MAX = 8
	self.rpg7_primary.AMMO_MAX = self.rpg7_primary.CLIP_AMMO_MAX * self.rpg7_primary.NR_CLIPS_MAX
    self.rpg7_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.rpg7_secondary = deep_clone(self.rpg7_primary)
    self.rpg7_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.roach_primary = deep_clone(self.b682)
    self.roach_primary.name_id = "wpn_roach_name"
    self.roach_primary.animations.reload_name_id = "b682"
    self.roach_primary.sounds.fire = "roach_fire"
    self.roach_primary.sounds.fire_single = "roach_fire"
    self.roach_primary.weapon_hold = "siltstone"
    self.roach_primary.rays = 1
    self.roach_primary.CLIP_AMMO_MAX = 1
    self.roach_primary.NR_CLIPS_MAX = 20
    self.roach_primary.AMMO_MAX = self.roach_primary.CLIP_AMMO_MAX * self.roach_primary.NR_CLIPS_MAX
    self.roach_primary.damage_near = 100000
    self.roach_primary.damage_far = 100000
    self.roach_primary.ignore_damage_upgrades = true
    self.roach_primary.armor_piercing_chance = 1
    self.roach_primary.can_shoot_through_enemy = true
    self.roach_primary.can_shoot_through_wall = true
    self.roach_primary.can_shoot_through_shield = true
    self.roach_primary.muzzleflash = "effects/payday2/particles/weapons/50cal_auto_fps"
    self.roach_primary.stats.damage = 90
    self.roach_primary.stats.spread = 26
    self.roach_primary.stats.spread_moving = 25
    self.roach_primary.stats.recoil = 5
    self.roach_primary.stats.concealment = 1
    self.roach_primary.stats_modifiers = {damage = 1000}
    self.roach_primary.fire_mode_data = {fire_rate = 2}
    self.roach_primary.kick = {
    standing = {
		6.0,
		4.0,
		4.0,
		-4.0
    }, 
    crouching = {
        6.0,
		4.0,
		4.0,
		-4.0
    },
    steelsight = {
        6.0,
		4.0,
		4.0,
		-4.0
    }}
    self.roach_secondary = deep_clone(self.roach_primary)
    self.roach_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
	-- What about Nepgear with a shovel? :shovelthinking:
	
    self.ak74_primary = deep_clone(self.ak74)
    self.ak74_primary.animations.reload_name_id = "ak74"
    self.ak74_primary.weapon_hold = "ak47"    --gee, that's not confusing at all
    self.ak74_primary.stats_modifiers = {damage = 2}
    self.ak74_primary.NR_CLIPS_MAX = self.ak74_primary.NR_CLIPS_MAX * 2
    self.ak74_primary.AMMO_MAX = self.ak74_primary.CLIP_AMMO_MAX * self.ak74_primary.NR_CLIPS_MAX
    self.ak74_primary.use_data = {selection_index = PRIMARY}
    self.ak74_secondary = deep_clone(self.ak74_primary)
    self.ak74_secondary.use_data = {selection_index = SECONDARY}
    
    self.ching_primary = deep_clone(self.ching)
    self.ching_primary.animations.reload_name_id = "ching"
    self.ching_primary.weapon_hold = "ching"
    self.ching_primary.stats_modifiers = {damage = 2}
    self.ching_primary.NR_CLIPS_MAX = self.ching_primary.NR_CLIPS_MAX
    self.ching_primary.AMMO_MAX = self.ching_primary.CLIP_AMMO_MAX * self.ching_primary.NR_CLIPS_MAX
    self.ching_primary.use_data = {selection_index = PRIMARY}
    self.ching_secondary = deep_clone(self.ching_primary)
    self.ching_secondary.use_data = {selection_index = SECONDARY}
    
    self.lemming_primary = deep_clone(self.lemming)
    self.lemming_primary.name_id = "wpn_lemming_name"
    self.lemming_primary.animations.reload_name_id = "lemming"
    self.lemming_primary.weapon_hold = "packrat"
    self.lemming_primary.stats_modifiers = {damage = 2}
    self.lemming_primary.NR_CLIPS_MAX = self.lemming_primary.NR_CLIPS_MAX * 2
    self.lemming_primary.AMMO_MAX = self.lemming_primary.CLIP_AMMO_MAX * self.lemming_primary.NR_CLIPS_MAX
    self.lemming_primary.armor_piercing_chance = 0
    self.lemming_primary.can_shoot_through_enemy = false 
    self.lemming_primary.can_shoot_through_wall = false 
    self.lemming_primary.can_shoot_through_shield = false 
    self.lemming_primary.use_data = {selection_index = PRIMARY}
    self.lemming_secondary = deep_clone(self.lemming_primary)
    self.lemming_secondary.use_data = {selection_index = SECONDARY}
    
    self.m37_primary = deep_clone(self.m37)
    self.m37_primary.animations.reload_name_id = "m37"
    self.m37_primary.weapon_hold = "m37"
    self.m37_primary.stats_modifiers = {damage = 2}
    self.m37_primary.NR_CLIPS_MAX = self.m37_primary.NR_CLIPS_MAX * 2
    self.m37_primary.AMMO_MAX = self.m37_primary.CLIP_AMMO_MAX * self.m37_primary.NR_CLIPS_MAX
    self.m37_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.m37_secondary = deep_clone(self.m37_primary)
    self.m37_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
    
    self.r870_primary = deep_clone(self.r870)
    self.r870_primary.animations.reload_name_id = "r870_shotgun"
    self.r870_primary.weapon_hold = "r870_shotgun"
    self.r870_primary.stats_modifiers = {damage = 2}
    self.r870_primary.NR_CLIPS_MAX = self.r870_primary.NR_CLIPS_MAX * 2
    self.r870_primary.AMMO_MAX = self.r870_primary.CLIP_AMMO_MAX * self.r870_primary.NR_CLIPS_MAX
    self.r870_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.r870_secondary = deep_clone(self.r870_primary)
    self.r870_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
    
    self.erma_primary = deep_clone(self.erma)
    self.erma_primary.animations.reload_name_id = "erma"
    self.erma_primary.weapon_hold = "erma"
    self.erma_primary.stats_modifiers = {damage = 2}
    self.erma_primary.NR_CLIPS_MAX = self.erma_primary.NR_CLIPS_MAX * 3
    self.erma_primary.AMMO_MAX = self.erma_primary.CLIP_AMMO_MAX * self.erma_primary.NR_CLIPS_MAX
    self.erma_primary.use_data = {selection_index = PRIMARY}
    self.erma_secondary = deep_clone(self.erma_primary)
    self.erma_secondary.use_data = {selection_index = SECONDARY}
    
    self.schakal_primary = deep_clone(self.schakal)
    self.schakal_primary.animations.reload_name_id = "schakal"
    self.schakal_primary.weapon_hold = "schakal"
    self.schakal_primary.stats_modifiers = {damage = 2}
    self.schakal_primary.NR_CLIPS_MAX = self.schakal_primary.NR_CLIPS_MAX * 2
    self.schakal_primary.AMMO_MAX = self.schakal_primary.CLIP_AMMO_MAX * self.schakal_primary.NR_CLIPS_MAX
    self.schakal_primary.use_data = {selection_index = PRIMARY}
    self.schakal_secondary = deep_clone(self.schakal_primary)
    self.schakal_secondary.use_data = {selection_index = SECONDARY}
    
    self.tec9_primary = deep_clone(self.tec9)
    self.tec9_primary.animations.reload_name_id = "tec9"
    self.tec9_primary.weapon_hold = "tec9"
    self.tec9_primary.stats_modifiers = {damage = 2}
    self.tec9_primary.use_data = {selection_index = PRIMARY}
    self.tec9_secondary = deep_clone(self.tec9_primary)
    self.tec9_secondary.use_data = {selection_index = SECONDARY}

    self.msr_primary = deep_clone(self.msr)
    self.msr_primary.animations.reload_name_id = "msr"
    self.msr_primary.weapon_hold = "msr"
    self.msr_primary.stats_modifiers = {damage = 2}
    self.msr_primary.NR_CLIPS_MAX = self.msr_primary.NR_CLIPS_MAX * 2
    self.msr_primary.AMMO_MAX = self.msr_primary.CLIP_AMMO_MAX * self.msr_primary.NR_CLIPS_MAX
    self.msr_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.msr_secondary = deep_clone(self.msr_primary)
    self.msr_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}

    self:_init_upgraded_zm_weapons()
end

function WeaponTweakData:_init_upgraded_zm_weapons()
    self.new_m14_upg_primary = deep_clone(self.new_m14_primary)
    self.new_m14_upg_primary.name_id = "wpn_m308_upg_name"
    self.new_m14_upg_primary.sounds.fire = "zm_pew_rifle"
    self.new_m14_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.new_m14_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.new_m14_upg_primary.CLIP_AMMO_MAX = 30
    self.new_m14_upg_primary.NR_CLIPS_MAX = 7
    self.new_m14_upg_primary.AMMO_MAX = self.new_m14_upg_primary.CLIP_AMMO_MAX * self.new_m14_upg_primary.NR_CLIPS_MAX
    self.new_m14_upg_primary.stats_modifiers = {damage = 8}
    self.new_m14_upg_primary.armor_piercing_chance = 1
    self.new_m14_upg_primary.can_shoot_through_enemy = true
    self.new_m14_upg_secondary = deep_clone(self.new_m14_upg_primary)
    self.new_m14_upg_secondary.use_data = {selection_index = SECONDARY}

    self.m95_upg_primary = deep_clone(self.m95_primary)
    self.m95_upg_primary.name_id = "wpn_m95_upg_name"
    self.m95_upg_primary.CLIP_AMMO_MAX = 10
    self.m95_upg_primary.NR_CLIPS_MAX = 4
    self.m95_upg_primary.AMMO_MAX = self.m95_upg_primary.CLIP_AMMO_MAX * self.m95_upg_primary.NR_CLIPS_MAX
    self.m95_upg_primary.sounds.fire = "zm_pew_snp_b"
    self.m95_upg_primary.sounds.fire_single = "zm_pew_snp_b"
    self.m95_upg_primary.stats_modifiers = {damage = 100}
    self.m95_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m95_upg_secondary = deep_clone(self.m95_upg_primary)
    self.m95_upg_secondary.use_data = {selection_index = SECONDARY}

    self.colt_1911_upg_primary = deep_clone(self.arbiter)
    self.colt_1911_upg_primary.weapon_hold = "colt_1911"
    self.colt_1911_upg_primary.timers = {
		reload_not_empty = 1.47,
		reload_empty = 2.12,
		unequip = 0.5,
		equip = 0.35
	}
    self.colt_1911_upg_primary.animations = {
		fire = "recoil",
		reload = "reload",
		reload_not_empty = "reload_not_empty",
		equip_id = "equip_glock",
		recoil_steelsight = true,
		magazine_empty = "last_recoil",
        reload_name_id = "colt_1911"
    }
    self.colt_1911_upg_primary.fire_mode_data = {fire_rate = 0.166}
    self.colt_1911_upg_primary.name_id = "wpn_m1911_upg_name"
    self.colt_1911_upg_primary.sounds.fire = "zm_pew_m1911"
    self.colt_1911_upg_primary.sounds.fire_single = "zm_pew_m1911"
    self.colt_1911_upg_primary.CLIP_AMMO_MAX = 12
    self.colt_1911_upg_primary.NR_CLIPS_MAX = 4
    self.colt_1911_upg_primary.AMMO_MAX = self.colt_1911_upg_primary.CLIP_AMMO_MAX * self.colt_1911_upg_primary.NR_CLIPS_MAX
    self.colt_1911_upg_primary.stats_modifiers = {damage = 20}
    self.colt_1911_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.colt_1911_upg_primary.use_data = {selection_index = PRIMARY}
    self.colt_1911_upg_secondary = deep_clone(self.colt_1911_upg_primary)
    self.colt_1911_upg_secondary.use_data = {selection_index = SECONDARY}

    self.b682_upg_primary = deep_clone(self.b682_primary)
    self.b682_upg_primary.name_id = "wpn_jocy_upg_name"
    self.b682_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.b682_upg_primary.sounds.fire = "zm_pew_shts"
    self.b682_upg_primary.sounds.fire_single = "zm_pew_shts"
    self.b682_upg_primary.stats_modifiers = {damage = 8}
    self.b682_upg_primary.CLIP_AMMO_MAX = 4
    self.b682_upg_primary.NR_CLIPS_MAX = 16
    self.b682_upg_primary.AMMO_MAX = self.b682_upg_primary.CLIP_AMMO_MAX * self.b682_upg_primary.NR_CLIPS_MAX
    self.b682_upg_secondary = deep_clone(self.b682_upg_primary)
    self.b682_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}

    self.mp9_upg_primary = deep_clone(self.mp9_primary)
    self.mp9_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.mp9_upg_primary.sounds.fire = "zm_pew_smg"
    self.mp9_upg_primary.sounds.fire_single = "zm_pew_smg"
    self.mp9_upg_primary.CLIP_AMMO_MAX = 64
    self.mp9_upg_primary.NR_CLIPS_MAX = 8
    self.mp9_upg_primary.AMMO_MAX = self.mp9_upg_primary.CLIP_AMMO_MAX * self.mp9_upg_primary.NR_CLIPS_MAX
    self.mp9_upg_primary.stats_modifiers = {damage = 8}
    self.mp9_upg_primary.use_data = {selection_index = PRIMARY}
    self.mp9_upg_secondary = deep_clone(self.mp9_upg_primary)
    self.mp9_upg_secondary.use_data = {selection_index = SECONDARY}

    self.rpg7_upg_primary = deep_clone(self.rpg7_primary)
    self.rpg7_upg_primary.name_id = "wpn_rpg7_upg_name"
    self.rpg7_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.rpg7_upg_primary.sounds.fire = "zm_pew_m1911"
    self.rpg7_upg_primary.sounds.fire_single = "zm_pew_m1911"
    self.rpg7_upg_primary.stats_modifiers = {damage = 10}
    self.rpg7_upg_primary.fire_mode_data = {fire_rate = 0.11}
    self.rpg7_upg_primary.CLIP_AMMO_MAX = 5
    self.rpg7_upg_primary.NR_CLIPS_MAX = 5
    self.rpg7_upg_primary.AMMO_MAX = self.rpg7_upg_primary.CLIP_AMMO_MAX * self.rpg7_upg_primary.NR_CLIPS_MAX
    self.rpg7_upg_secondary = deep_clone(self.rpg7_upg_primary)
    self.rpg7_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
	
--for whom the shovel tolls
    self.amcar_upg_primary = deep_clone(self.amcar_primary)
    self.amcar_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.amcar_upg_primary.sounds.fire = "zm_pew_rifle"
    self.amcar_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.amcar_upg_primary.stats_modifiers = {damage = 10}
    self.amcar_upg_primary.CLIP_AMMO_MAX = 40
    self.amcar_upg_primary.NR_CLIPS_MAX = 9
    self.amcar_upg_primary.AMMO_MAX = self.amcar_upg_primary.CLIP_AMMO_MAX * self.amcar_upg_primary.NR_CLIPS_MAX
    self.amcar_upg_secondary = deep_clone(self.amcar_upg_primary)
    self.amcar_upg_secondary.use_data = {selection_index = SECONDARY}

    self.aug_upg_primary = deep_clone(self.aug_primary)
    self.aug_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.aug_upg_primary.sounds.fire = "zm_pew_rifle"
    self.aug_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.aug_upg_primary.stats_modifiers = {damage = 9}
    self.aug_upg_primary.CLIP_AMMO_MAX = 35
    self.aug_upg_primary.NR_CLIPS_MAX = 10
    self.aug_upg_primary.AMMO_MAX = self.aug_upg_primary.CLIP_AMMO_MAX * self.aug_upg_primary.NR_CLIPS_MAX
    self.aug_upg_secondary = deep_clone(self.aug_upg_primary)
    self.aug_upg_secondary.use_data = {selection_index = SECONDARY}

    self.fal_upg_primary = deep_clone(self.fal_primary)
    self.fal_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.fal_upg_primary.sounds.fire = "zm_pew_rifle"
    self.fal_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.fal_upg_primary.stats_modifiers = {damage = 8}
    self.fal_upg_primary.CLIP_AMMO_MAX = 30
    self.fal_upg_primary.NR_CLIPS_MAX = 7
    self.fal_upg_primary.AMMO_MAX = self.fal_upg_primary.CLIP_AMMO_MAX * self.fal_upg_primary.NR_CLIPS_MAX
    self.fal_upg_secondary = deep_clone(self.fal_upg_primary)
    self.fal_upg_secondary.use_data = {selection_index = SECONDARY}

    self.flint_upg_primary = deep_clone(self.flint_primary)
    self.flint_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.flint_upg_primary.sounds.fire = "zm_pew_rifle"
    self.flint_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.flint_upg_primary.stats_modifiers = {damage = 8}
    self.flint_upg_primary.CLIP_AMMO_MAX = 35
    self.flint_upg_primary.NR_CLIPS_MAX = 10
    self.flint_upg_primary.AMMO_MAX = self.flint_upg_primary.CLIP_AMMO_MAX * self.flint_upg_primary.NR_CLIPS_MAX
    self.flint_upg_secondary = deep_clone(self.flint_upg_primary)
    self.flint_upg_secondary.use_data = {selection_index = SECONDARY}

    self.m16_upg_primary = deep_clone(self.m16_primary)
    self.m16_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m16_upg_primary.sounds.fire = "zm_pew_rifle"
    self.m16_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.m16_upg_primary.stats_modifiers = {damage = 8}
    self.m16_upg_primary.CLIP_AMMO_MAX = 50
    self.m16_upg_primary.NR_CLIPS_MAX = 8
    self.m16_upg_primary.AMMO_MAX = self.m16_upg_primary.CLIP_AMMO_MAX * self.m16_upg_primary.NR_CLIPS_MAX
    self.m16_upg_secondary = deep_clone(self.m16_upg_primary)
    self.m16_upg_secondary.use_data = {selection_index = SECONDARY}

    self.scar_upg_primary = deep_clone(self.scar_primary)
    self.scar_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.scar_upg_primary.sounds.fire = "zm_pew_rifle"
    self.scar_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.scar_upg_primary.stats_modifiers = {damage = 10}
    self.scar_upg_primary.CLIP_AMMO_MAX = 35
    self.scar_upg_primary.NR_CLIPS_MAX = 9
    self.scar_upg_primary.AMMO_MAX = self.scar_upg_primary.CLIP_AMMO_MAX * self.scar_upg_primary.NR_CLIPS_MAX
    self.scar_upg_secondary = deep_clone(self.scar_upg_primary)
    self.scar_upg_secondary.use_data = {selection_index = SECONDARY}

    self.hk21_upg_primary = deep_clone(self.hk21_primary)
    self.hk21_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.hk21_upg_primary.sounds.fire = "zm_pew_lmg"
    self.hk21_upg_primary.sounds.fire_single = "zm_pew_lmg"
    self.hk21_upg_primary.stats_modifiers = {damage = 8}
    self.hk21_upg_primary.CLIP_AMMO_MAX = 150
    self.hk21_upg_primary.NR_CLIPS_MAX = 6
    self.hk21_upg_primary.AMMO_MAX = self.hk21_upg_primary.CLIP_AMMO_MAX * self.hk21_upg_primary.NR_CLIPS_MAX
    self.hk21_upg_secondary = deep_clone(self.hk21_upg_primary)
    self.hk21_upg_secondary.use_data = {selection_index = SECONDARY}

    self.m249_upg_primary = deep_clone(self.m249_primary)
    self.m249_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m249_upg_primary.sounds.fire = "zm_pew_lmg"
    self.m249_upg_primary.sounds.fire_single = "zm_pew_lmg"
    self.m249_upg_primary.stats_modifiers = {damage = 10}
    self.m249_upg_primary.CLIP_AMMO_MAX = 125
    self.m249_upg_primary.NR_CLIPS_MAX = 5
    self.m249_upg_primary.AMMO_MAX = self.m249_upg_primary.CLIP_AMMO_MAX * self.m249_upg_primary.NR_CLIPS_MAX
    self.m249_upg_secondary = deep_clone(self.m249_upg_primary)
    self.m249_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.breech_upg_primary = deep_clone(self.breech_primary)
    self.breech_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.breech_upg_primary.sounds.fire = "zm_pew_cobra"
    self.breech_upg_primary.sounds.fire_single = "zm_pew_cobra"
    self.breech_upg_primary.stats_modifiers = {damage = 14}
    self.breech_upg_primary.use_data = {selection_index = PRIMARY}
    self.breech_upg_primary.CLIP_AMMO_MAX = 16
    self.breech_upg_primary.NR_CLIPS_MAX = 6
    self.breech_upg_primary.AMMO_MAX = self.breech_upg_primary.CLIP_AMMO_MAX * self.breech_upg_primary.NR_CLIPS_MAX
    self.breech_upg_secondary = deep_clone(self.breech_upg_primary)
    self.breech_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.deagle_upg_primary = deep_clone(self.deagle_primary)
    self.deagle_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.deagle_upg_primary.sounds.fire = "zm_pew_cobra"
    self.deagle_upg_primary.sounds.fire_single = "zm_pew_cobra"
    self.deagle_upg_primary.stats_modifiers = {damage = 15}
    self.deagle_upg_primary.CLIP_AMMO_MAX = 10
    self.deagle_upg_primary.NR_CLIPS_MAX = 8
    self.deagle_upg_primary.use_data = {selection_index = PRIMARY}
    self.deagle_upg_primary.AMMO_MAX = self.deagle_upg_primary.CLIP_AMMO_MAX * self.deagle_upg_primary.NR_CLIPS_MAX
    self.deagle_upg_secondary = deep_clone(self.deagle_upg_primary)
    self.deagle_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.judge_upg_primary = deep_clone(self.judge_primary)
    self.judge_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.judge_upg_primary.sounds.fire = "zm_pew_shts"
    self.judge_upg_primary.sounds.fire_single = "zm_pew_shts"
    self.judge_upg_primary.stats_modifiers = {damage = 10}
    self.judge_upg_primary.CLIP_AMMO_MAX = 5
    self.judge_upg_primary.NR_CLIPS_MAX = 12
    self.judge_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.judge_upg_primary.AMMO_MAX = self.judge_upg_primary.CLIP_AMMO_MAX * self.judge_upg_primary.NR_CLIPS_MAX
    self.judge_upg_secondary = deep_clone(self.judge_upg_primary)
    self.judge_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.peacemaker_upg_primary = deep_clone(self.peacemaker_primary)
    self.peacemaker_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.peacemaker_upg_primary.sounds.fire = "zm_pew_cobra"
    self.peacemaker_upg_primary.sounds.fire_single = "zm_pew_cobra"
    self.peacemaker_upg_primary.stats_modifiers = {damage = 14}
    self.peacemaker_upg_primary.CLIP_AMMO_MAX = 6
    self.peacemaker_upg_primary.NR_CLIPS_MAX = 14
    self.peacemaker_upg_primary.armor_piercing_chance = 1
    self.peacemaker_upg_primary.can_shoot_through_enemy = true
    self.peacemaker_upg_primary.can_shoot_through_shield = true
    self.peacemaker_upg_primary.AMMO_MAX = self.peacemaker_upg_primary.CLIP_AMMO_MAX * self.peacemaker_upg_primary.NR_CLIPS_MAX
    self.peacemaker_upg_primary.use_data = {selection_index = PRIMARY}
    self.peacemaker_upg_secondary = deep_clone(self.peacemaker_upg_primary)
    self.peacemaker_upg_secondary.use_data = {selection_index = SECONDARY}

    self.new_raging_bull_upg_primary = deep_clone(self.new_raging_bull_primary)
    self.new_raging_bull_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.new_raging_bull_upg_primary.sounds.fire = "zm_pew_cobra"
    self.new_raging_bull_upg_primary.sounds.fire_single = "zm_pew_cobra"
    self.new_raging_bull_upg_primary.stats_modifiers = {damage = 16}
    self.new_raging_bull_upg_primary.CLIP_AMMO_MAX = 6
    self.new_raging_bull_upg_primary.NR_CLIPS_MAX = 10
    self.new_raging_bull_upg_primary.armor_piercing_chance = 1
    self.new_raging_bull_upg_primary.can_shoot_through_enemy = true
    self.new_raging_bull_upg_primary.can_shoot_through_shield = true
    self.new_raging_bull_upg_primary.AMMO_MAX = self.new_raging_bull_upg_primary.CLIP_AMMO_MAX * self.new_raging_bull_upg_primary.NR_CLIPS_MAX
    self.new_raging_bull_upg_primary.use_data = {selection_index = PRIMARY}
    self.new_raging_bull_upg_secondary = deep_clone(self.new_raging_bull_upg_primary)
    self.new_raging_bull_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.striker_upg_primary = deep_clone(self.striker_primary)
    self.striker_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.striker_upg_primary.sounds.fire = "zm_pew_shta"
    self.striker_upg_primary.sounds.fire_single = "zm_pew_shta"
    self.striker_upg_primary.stats_modifiers = {damage = 10}
    self.striker_upg_primary.CLIP_AMMO_MAX = 24
    self.striker_upg_primary.NR_CLIPS_MAX = 5
    self.striker_upg_primary.AMMO_MAX = self.striker_upg_primary.CLIP_AMMO_MAX * self.striker_upg_primary.NR_CLIPS_MAX
    self.striker_upg_primary.use_data = {selection_index = PRIMARY, align_place = "left_hand"}
    self.striker_upg_secondary = deep_clone(self.striker_upg_primary)
    self.striker_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}
	
    self.p90_upg_primary = deep_clone(self.p90_primary)
    self.p90_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.p90_upg_primary.sounds.fire = "zm_pew_smg"
    self.p90_upg_primary.sounds.fire_single = "zm_pew_smg"
    self.p90_upg_primary.stats_modifiers = {damage = 10}
    self.p90_upg_primary.CLIP_AMMO_MAX = 50
    self.p90_upg_primary.NR_CLIPS_MAX = 9
    self.p90_upg_primary.AMMO_MAX = self.p90_upg_primary.CLIP_AMMO_MAX * self.p90_upg_primary.NR_CLIPS_MAX
    self.p90_upg_primary.use_data = {selection_index = PRIMARY}
    self.p90_upg_secondary = deep_clone(self.p90_upg_primary)
    self.p90_upg_secondary.use_data = {selection_index = SECONDARY}
	
    self.m1928_upg_primary = deep_clone(self.m1928_primary)
    self.m1928_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m1928_upg_primary.sounds.fire = "zm_pew_smg"
    self.m1928_upg_primary.sounds.fire_single = "zm_pew_smg"
    self.m1928_upg_primary.stats_modifiers = {damage = 10}
    self.m1928_upg_primary.CLIP_AMMO_MAX = 100
    self.m1928_upg_primary.NR_CLIPS_MAX = 4
    self.m1928_upg_primary.AMMO_MAX = self.m1928_upg_primary.CLIP_AMMO_MAX * self.m1928_upg_primary.NR_CLIPS_MAX
    self.m1928_upg_primary.use_data = {selection_index = PRIMARY}
    self.m1928_upg_secondary = deep_clone(self.m1928_upg_primary)
    self.m1928_upg_secondary.use_data = {selection_index = SECONDARY}
	
	--more pew for the shovel gods
	
	self.ak74_upg_primary = deep_clone(self.ak74_primary)
    self.ak74_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.ak74_upg_primary.sounds.fire = "zm_pew_rifle"
    self.ak74_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.ak74_upg_primary.stats_modifiers = {damage = 10}
    self.ak74_upg_primary.CLIP_AMMO_MAX = 45
    self.ak74_upg_primary.NR_CLIPS_MAX = 8
    self.ak74_upg_primary.AMMO_MAX = self.ak74_upg_primary.CLIP_AMMO_MAX * self.ak74_upg_primary.NR_CLIPS_MAX
    self.ak74_upg_primary.use_data = {selection_index = PRIMARY}
    self.ak74_upg_secondary = deep_clone(self.ak74_upg_primary)
    self.ak74_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.ching_upg_primary = deep_clone(self.ching_primary)
    self.ching_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.ching_upg_primary.sounds.fire = "zm_pew_rifle"
    self.ching_upg_primary.sounds.fire_single = "zm_pew_rifle"
    self.ching_upg_primary.stats_modifiers = {damage = 8}
    self.ching_upg_primary.CLIP_AMMO_MAX = 20
    self.ching_upg_primary.NR_CLIPS_MAX = 7
    self.ching_upg_primary.can_shoot_through_shield = true
    self.ching_upg_primary.AMMO_MAX = self.ching_upg_primary.CLIP_AMMO_MAX * self.ching_upg_primary.NR_CLIPS_MAX
    self.ching_upg_primary.use_data = {selection_index = PRIMARY}
    self.ching_upg_secondary = deep_clone(self.ching_upg_primary)
    self.ching_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.lemming_upg_primary = deep_clone(self.lemming_primary)
    self.lemming_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.lemming_upg_primary.sounds.fire = "zm_pew_cobra"
    self.lemming_upg_primary.sounds.fire_single = "zm_pew_cobra"
    self.lemming_upg_primary.stats_modifiers = {damage = 13}
    self.lemming_upg_primary.CLIP_AMMO_MAX = 20
    self.lemming_upg_primary.NR_CLIPS_MAX = 7
    self.lemming_upg_primary.armor_piercing_chance = 1
    self.lemming_upg_primary.can_shoot_through_enemy = true 
    self.lemming_upg_primary.can_shoot_through_wall = true 
    self.lemming_upg_primary.can_shoot_through_shield = true 
    self.lemming_upg_primary.AMMO_MAX = self.lemming_upg_primary.CLIP_AMMO_MAX * self.lemming_upg_primary.NR_CLIPS_MAX
    self.lemming_upg_primary.use_data = {selection_index = PRIMARY}
    self.lemming_upg_secondary = deep_clone(self.lemming_upg_primary)
    self.lemming_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.m37_upg_primary = deep_clone(self.m37_primary)
    self.m37_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.m37_upg_primary.sounds.fire = "zm_pew_shts"
    self.m37_upg_primary.sounds.fire_single = "zm_pew_shts"
    self.m37_upg_primary.stats_modifiers = {damage = 12}
    self.m37_upg_primary.CLIP_AMMO_MAX = 16
    self.m37_upg_primary.NR_CLIPS_MAX = 7
    self.m37_upg_primary.AMMO_MAX = self.m37_upg_primary.CLIP_AMMO_MAX * self.m37_upg_primary.NR_CLIPS_MAX
    self.m37_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.m37_upg_secondary = deep_clone(self.m37_upg_primary)
    self.m37_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
    self.r870_upg_primary = deep_clone(self.r870_primary)
    self.r870_upg_primary.name_id = "wpn_r870_upg_name"
    self.r870_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.r870_upg_primary.sounds.fire = "zm_pew_shts"
    self.r870_upg_primary.sounds.fire_single = "zm_pew_shts"
    self.r870_upg_primary.stats_modifiers = {damage = 10}
    self.r870_upg_primary.CLIP_AMMO_MAX = 12
    self.r870_upg_primary.NR_CLIPS_MAX = 9
    self.r870_upg_primary.AMMO_MAX = self.r870_upg_primary.CLIP_AMMO_MAX * self.r870_upg_primary.NR_CLIPS_MAX
    self.r870_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.r870_upg_secondary = deep_clone(self.r870_upg_primary)
    self.r870_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
	
	self.erma_upg_primary = deep_clone(self.erma_primary)
    self.erma_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.erma_upg_primary.sounds.fire = "zm_pew_smg"
    self.erma_upg_primary.sounds.fire_single = "zm_pew_smg"
    self.erma_upg_primary.stats_modifiers = {damage = 14}
    self.erma_upg_primary.CLIP_AMMO_MAX = 64
    self.erma_upg_primary.NR_CLIPS_MAX = 4
    self.erma_upg_primary.AMMO_MAX = self.erma_upg_primary.CLIP_AMMO_MAX * self.erma_upg_primary.NR_CLIPS_MAX
    self.erma_upg_primary.use_data = {selection_index = PRIMARY}
    self.erma_upg_secondary = deep_clone(self.erma_upg_primary)
    self.erma_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.schakal_upg_primary = deep_clone(self.schakal_primary)
    self.schakal_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.schakal_upg_primary.sounds.fire = "zm_pew_smg"
    self.schakal_upg_primary.sounds.fire_single = "zm_pew_smg"
    self.schakal_upg_primary.stats_modifiers = {damage = 14}
    self.schakal_upg_primary.CLIP_AMMO_MAX = 48
    self.schakal_upg_primary.NR_CLIPS_MAX = 6
    self.schakal_upg_primary.AMMO_MAX = self.schakal_upg_primary.CLIP_AMMO_MAX * self.schakal_upg_primary.NR_CLIPS_MAX
    self.schakal_upg_primary.use_data = {selection_index = PRIMARY}
    self.schakal_upg_secondary = deep_clone(self.schakal_upg_primary)
    self.schakal_upg_secondary.use_data = {selection_index = SECONDARY}
	
	self.tec9_upg_primary = deep_clone(self.tec9_primary)
    self.tec9_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.tec9_upg_primary.sounds.fire = "zm_pew_smg"
    self.tec9_upg_primary.sounds.fire_single = "zm_pew_smg"
    self.tec9_upg_primary.stats_modifiers = {damage = 15}
    self.tec9_upg_primary.CLIP_AMMO_MAX = 25
    self.tec9_upg_primary.NR_CLIPS_MAX = 10
    self.tec9_upg_primary.AMMO_MAX = self.tec9_upg_primary.CLIP_AMMO_MAX * self.tec9_upg_primary.NR_CLIPS_MAX
    self.tec9_upg_primary.use_data = {selection_index = PRIMARY}
    self.tec9_upg_secondary = deep_clone(self.tec9_upg_primary)
    self.tec9_upg_secondary.use_data = {selection_index = SECONDARY}

    self.msr_upg_primary = deep_clone(self.msr_primary)
    self.msr_upg_primary.name_id = "wpn_msr_upg_name"
    self.msr_upg_primary.CLIP_AMMO_MAX = 10
    self.msr_upg_primary.NR_CLIPS_MAX = 6
    self.msr_upg_primary.AMMO_MAX = self.msr_upg_primary.CLIP_AMMO_MAX * self.msr_upg_primary.NR_CLIPS_MAX
    self.msr_upg_primary.sounds.fire = "zm_pew_snp_b"
    self.msr_upg_primary.sounds.fire_single = "zm_pew_snp_e"
    self.msr_upg_primary.stats_modifiers = {damage = 85}
    self.msr_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.msr_upg_secondary = deep_clone(self.msr_upg_primary)
    self.msr_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "left_hand"}

    self.roach_upg_primary = deep_clone(self.roach_primary)
    self.roach_upg_primary.name_id = "wpn_roach_upg_name"
    self.roach_upg_primary.muzzleflash = "effects/zm/zm_pap_muzzle"
    self.roach_upg_primary.fire_mode_data = {fire_rate = 0.11}
    self.roach_upg_primary.CLIP_AMMO_MAX = 6
    self.roach_upg_primary.NR_CLIPS_MAX = 5
    self.roach_upg_primary.AMMO_MAX = self.roach_upg_primary.CLIP_AMMO_MAX * self.roach_upg_primary.NR_CLIPS_MAX
    self.roach_upg_primary.sounds.fire = "zm_pew_roach"
    self.roach_upg_primary.sounds.fire_single = "zm_pew_roach"
    self.roach_upg_primary.use_data = {selection_index = PRIMARY, align_place = "right_hand"}
    self.roach_upg_secondary = deep_clone(self.roach_upg_primary)
    self.roach_upg_secondary.use_data = {selection_index = SECONDARY, align_place = "right_hand"}
end