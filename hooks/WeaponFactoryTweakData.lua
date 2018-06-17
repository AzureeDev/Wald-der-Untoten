Hooks:PostHook(WeaponFactoryTweakData, "init", "zm_init_weapon_data_factory", function(self)
    self:_init_no_weapon()
    self:_init_wunderwaffe()
    self:_init_wunderwaffe_dg3()

    self:_init_roach()

    self:_init_multiplix()
    self:_init_upgraded_multiplix()
end)

function WeaponFactoryTweakData:_init_no_weapon()
    self.parts.wpn_fps_pis_nothing_sight = deep_clone(self.parts.wpn_fps_m4_uupg_o_flipup)
    self.parts.wpn_fps_pis_nothing_sight.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_pis_nothing_body_standard = deep_clone(self.parts.wpn_fps_pis_p226_body_standard)
    self.parts.wpn_fps_pis_nothing_body_standard.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_pis_nothing_body_standard.stats.damage = -10
    self.parts.wpn_fps_pis_nothing_body_standard.stats.concealment = 10
    self.parts.wpn_fps_pis_nothing_body_standard.stats.recoil = -24
    self.parts.wpn_fps_pis_nothing_body_standard.stats.spread = -8

    self.wpn_fps_ass_nothing2_primary = {
        unit = "units/mods/weapons/wpn_fps_ass_nothing2/wpn_fps_ass_nothing2",
		optional_types = {
			"gadget",
			"barrel_ext"
		},
		default_blueprint = {
			"wpn_fps_pis_nothing_sight",
			"wpn_fps_pis_nothing_body_standard"
		},
		uses_parts = {
            "wpn_fps_pis_nothing_sight",
			"wpn_fps_pis_nothing_body_standard"
		}
    }

    self.wpn_fps_ass_nothing2_primary.override = {
		wpn_fps_pis_nothing_sight = {
			stats = {
				zoom = 0
			},
			stance_mod = {
				wpn_fps_ass_nothing2 = {
					translation = Vector3( 9999999999, 99999999, 999999)
				}
			}
        }
    }
end

function WeaponFactoryTweakData:_init_wunderwaffe()
    self.parts.wpn_fps_spe_wunderwaffe_body = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_body.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_body"
    self.parts.wpn_fps_spe_wunderwaffe_body.type = "barrel"
    self.parts.wpn_fps_spe_wunderwaffe_body.third_unit = "units/mods/weapons/wpn_third_spe_wunderwaffe_pts/wpn_third_spe_wunderwaffe_body"
	
    self.parts.wpn_fps_spe_wunderwaffe_illum = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_illum.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_illum"
    self.parts.wpn_fps_spe_wunderwaffe_illum.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_illum.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_mag = deep_clone(self.parts.wpn_fps_ass_m14_m_standard)
    self.parts.wpn_fps_spe_wunderwaffe_mag.animations = nil
    self.parts.wpn_fps_spe_wunderwaffe_mag.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_mag"
    self.parts.wpn_fps_spe_wunderwaffe_mag.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_bulb_outer"
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_bulb_outer.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_center_glow = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_center_glow.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_center_glow"
    self.parts.wpn_fps_spe_wunderwaffe_center_glow.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_center_glow.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_center_tube = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_center_tube.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_center_tube"
    self.parts.wpn_fps_spe_wunderwaffe_center_tube.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_center_tube.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
   
    self.parts.wpn_fps_spe_wunderwaffe_metal = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_metal.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_metal"
    self.parts.wpn_fps_spe_wunderwaffe_metal.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_metal.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_pipes = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_pipes.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_pipes"
    self.parts.wpn_fps_spe_wunderwaffe_pipes.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_pipes.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_wood = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_wood.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_wood"
    self.parts.wpn_fps_spe_wunderwaffe_wood.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_wood.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
 
    self.wpn_fps_spe_wunderwaffe_primary = deep_clone(self.wpn_fps_snp_mosin)
    self.wpn_fps_spe_wunderwaffe_primary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe"
    self.wpn_fps_spe_wunderwaffe_primary.default_blueprint = {
        "wpn_fps_spe_wunderwaffe_body",
        "wpn_fps_spe_wunderwaffe_illum",
        "wpn_fps_spe_wunderwaffe_mag",
        "wpn_fps_spe_wunderwaffe_bulb_outer",
        "wpn_fps_spe_wunderwaffe_center_glow",
        "wpn_fps_spe_wunderwaffe_center_tube",
        "wpn_fps_spe_wunderwaffe_metal",
        "wpn_fps_spe_wunderwaffe_pipes",
        "wpn_fps_spe_wunderwaffe_wood"
    }
 
    self.wpn_fps_spe_wunderwaffe_secondary = deep_clone(self.wpn_fps_spe_wunderwaffe_primary)
    self.wpn_fps_spe_wunderwaffe_secondary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_secondary"
end
 
function WeaponFactoryTweakData:_init_wunderwaffe_dg3()
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_body"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body.type = "barrel"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_body.third_unit = "units/mods/weapons/wpn_third_spe_wunderwaffe_pts/wpn_third_spe_wunderwaffe_dg3_body"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_illum"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_illum.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag = deep_clone(self.parts.wpn_fps_ass_m14_m_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag.animations = nil
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_mag"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_mag.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_bulb_outer"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_bulb_outer.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
   
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_metal"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_metal.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_pipes"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_pipes.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
	
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood = deep_clone(self.parts.wpn_fps_snp_mosin_body_standard)
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe_pts/wpn_fps_spe_wunderwaffe_dg3_wood"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood.type = "extra"
    self.parts.wpn_fps_spe_wunderwaffe_dg3_wood.third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
 
    self.wpn_fps_spe_wunderwaffe_dg3_primary = deep_clone(self.wpn_fps_snp_mosin)
    self.wpn_fps_spe_wunderwaffe_dg3_primary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_dg3"
    self.wpn_fps_spe_wunderwaffe_dg3_primary.default_blueprint = {
        "wpn_fps_spe_wunderwaffe_dg3_body",
        "wpn_fps_spe_wunderwaffe_dg3_illum",
        "wpn_fps_spe_wunderwaffe_dg3_mag",
        "wpn_fps_spe_wunderwaffe_dg3_bulb_outer",
        "wpn_fps_spe_wunderwaffe_center_glow",
        "wpn_fps_spe_wunderwaffe_center_tube",
        "wpn_fps_spe_wunderwaffe_dg3_metal",
        "wpn_fps_spe_wunderwaffe_dg3_pipes",
        "wpn_fps_spe_wunderwaffe_dg3_wood"
    }
    self.wpn_fps_spe_wunderwaffe_dg3_secondary = deep_clone(self.wpn_fps_spe_wunderwaffe_dg3_primary)
    self.wpn_fps_spe_wunderwaffe_dg3_secondary.unit = "units/mods/weapons/wpn_fps_spe_wunderwaffe/wpn_fps_spe_wunderwaffe_dg3_secondary"
end

function WeaponFactoryTweakData:_init_roach()
    self.parts.wpn_fps_special_roach_barrel = deep_clone(self.parts.wpn_fps_shot_b682_b_long)
    self.parts.wpn_fps_special_roach_barrel.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_barrel"
    self.parts.wpn_fps_special_roach_barrel_pap = deep_clone(self.parts.wpn_fps_shot_b682_b_long)
    self.parts.wpn_fps_special_roach_barrel_pap.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_barrel_pap"
    self.parts.wpn_fps_special_roach_frame = deep_clone(self.parts.wpn_fps_shot_b682_s_long)
    self.parts.wpn_fps_special_roach_frame.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_frame"
    self.parts.wpn_fps_special_roach_frame_pap = deep_clone(self.parts.wpn_fps_shot_b682_s_long)
    self.parts.wpn_fps_special_roach_frame_pap.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_frame_pap"
    self.parts.wpn_fps_special_roach_discharge = deep_clone(self.parts.wpn_fps_shot_b682_s_long)
    self.parts.wpn_fps_special_roach_discharge.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_discharge"
    self.parts.wpn_fps_special_roach_irons = deep_clone(self.parts.wpn_fps_smg_polymer_o_iron)
    self.parts.wpn_fps_special_roach_irons.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_special_roach_irons.stats.zoom = 12
    self.parts.wpn_fps_special_roach_a_sabot = deep_clone(self.parts.wpn_fps_ammo_type)
    self.parts.wpn_fps_special_roach_a_sabot.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_special_roach_a_tungsten = deep_clone(self.parts.wpn_fps_ammo_type)
    self.parts.wpn_fps_special_roach_a_tungsten.unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"
    self.parts.wpn_fps_special_roach_fl_built = deep_clone(self.parts.wpn_fps_upg_fl_ass_peq15)
    self.parts.wpn_fps_special_roach_fl_built.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_fl_built"
    self.parts.wpn_fps_special_roach_o_inside = deep_clone(self.parts.wpn_fps_shot_b682_b_long)
    self.parts.wpn_fps_special_roach_o_inside.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_o_inside"
    self.parts.wpn_fps_special_roach_o_inside.type = "scope_inside"
    self.parts.wpn_fps_special_roach_o_lens = deep_clone(self.parts.wpn_fps_shot_b682_b_long)
    self.parts.wpn_fps_special_roach_o_lens.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_o_lens"
    self.parts.wpn_fps_special_roach_o_lens.type = "scope_lens"
    self.parts.wpn_fps_special_roach_o_reticle = deep_clone(self.parts.wpn_fps_shot_b682_b_long)
    self.parts.wpn_fps_special_roach_o_reticle.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_o_reticle"
    self.parts.wpn_fps_special_roach_o_reticle.type = "scope_reticle"
    self.parts.wpn_fps_special_roach_o_display = deep_clone(self.parts.wpn_fps_upg_o_spot)
    self.parts.wpn_fps_special_roach_o_display.unit = "units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_o_display"
    self.parts.wpn_fps_special_roach_o_display.type = "scope_display"
    self.parts.wpn_fps_special_roach_o_display.a_obj = "a_b"
    self.parts.wpn_fps_special_roach_o_display.reticle_obj = "nil"

    self.parts.wpn_fps_special_roach_irons.stance_mod = {
		wpn_fps_special_roach_primary = {
			translation = Vector3(0, -12.5, -5.3)
        },
        wpn_fps_special_roach_secondary = {
			translation = Vector3(0, -12.5, -5.3)
        },
        wpn_fps_special_roach_upg_primary = {
			translation = Vector3(0, -12.5, -5.3)
        },
        wpn_fps_special_roach_upg_secondary = {
			translation = Vector3(0, -12.5, -5.3)
		}
	}
	self.parts.wpn_fps_special_roach_irons.perks = {"scope", "highlight"}
	self.parts.wpn_fps_special_roach_barrel.adds = {"wpn_fps_special_roach_o_inside", "wpn_fps_special_roach_o_lens", "wpn_fps_special_roach_o_reticle"}
	self.parts.wpn_fps_special_roach_frame.adds = {"wpn_fps_special_roach_discharge"}
	self.parts.wpn_fps_special_roach_barrel_pap.adds = {"wpn_fps_special_roach_o_inside", "wpn_fps_special_roach_o_lens", "wpn_fps_special_roach_o_reticle"}
	--self.parts.wpn_fps_special_roach_frame_pap.adds = {"wpn_fps_special_roach_discharge"}
	self.parts.wpn_fps_special_roach_fl_built.stats = nil
	self.parts.wpn_fps_special_roach_fl_built.adds = {"wpn_fps_upg_fl_ass_peq15_flashlight"}
	self.parts.wpn_fps_special_roach_fl_built.perks = {"gadget"}

	self.parts.wpn_fps_special_roach_a_sabot.custom_stats = {
		rays = 1,
		armor_piercing_add = 1,
		can_shoot_through_enemy = true, 
		can_shoot_through_shield = true, 
		can_shoot_through_wall = true, 
		damage_near_mul = 1.25,
		damage_far_mul = 1.0,
		bullet_class = "InstantExplosiveBulletBase"
	}
	
	self.parts.wpn_fps_special_roach_a_tungsten.override = {
		wpn_fps_special_roach_barrel = { unit="units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_barrel-50cal" },
		wpn_fps_special_roach_discharge = { unit="units/mods/weapons/wpn_fps_special_roach_pts/wpn_fps_special_roach_discharge-small" }
	}
	self.parts.wpn_fps_special_roach_a_tungsten.custom_stats = {
		rays = 1,
		armor_piercing_add = 1,
		can_shoot_through_enemy = true, 
		can_shoot_through_shield = true, 
		can_shoot_through_wall = true
    }

    self.wpn_fps_special_roach_primary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_special_roach_primary.unit = "units/mods/weapons/wpn_fps_special_roach/wpn_fps_special_roach_primary"
    self.wpn_fps_special_roach_primary.default_blueprint = {
        "wpn_fps_special_roach_barrel",
        "wpn_fps_special_roach_frame",
        "wpn_fps_special_roach_irons",
        "wpn_fps_special_roach_a_sabot",
        "wpn_fps_special_roach_fl_built"
    }
    self.wpn_fps_special_roach_secondary = deep_clone(self.wpn_fps_special_roach_primary)
    self.wpn_fps_special_roach_secondary.unit = "units/mods/weapons/wpn_fps_special_roach/wpn_fps_special_roach_secondary"

    self.wpn_fps_special_roach_upg_primary = deep_clone(self.wpn_fps_special_roach_primary)
    self.wpn_fps_special_roach_upg_primary.unit = "units/mods/weapons/wpn_fps_special_roach/wpn_fps_special_roach_upg_primary"
    self.wpn_fps_special_roach_upg_primary.default_blueprint = {
        "wpn_fps_special_roach_barrel_pap",
        "wpn_fps_special_roach_frame_pap",
        "wpn_fps_special_roach_irons",
        "wpn_fps_special_roach_a_sabot",
        "wpn_fps_special_roach_fl_built"
    }
    self.wpn_fps_special_roach_upg_secondary = deep_clone(self.wpn_fps_special_roach_upg_primary)
    self.wpn_fps_special_roach_upg_secondary.unit = "units/mods/weapons/wpn_fps_special_roach/wpn_fps_special_roach_upg_secondary"
end

function WeaponFactoryTweakData:_init_multiplix()
    self.wpn_fps_pis_1911_primary = deep_clone(self.wpn_fps_pis_1911)
    self.wpn_fps_pis_1911_primary.unit = "new_weapon_units/wpn_fps_pis_1911_primary"
    self.wpn_fps_pis_1911_secondary = deep_clone(self.wpn_fps_pis_1911)
    self.wpn_fps_pis_1911_secondary.unit = "new_weapon_units/wpn_fps_pis_1911_secondary"

    self.wpn_fps_ass_m14_primary = deep_clone(self.wpn_fps_ass_m14)
    self.wpn_fps_ass_m14_primary.unit = "new_weapon_units/wpn_fps_ass_m14_primary"
    self.wpn_fps_ass_m14_secondary = deep_clone(self.wpn_fps_ass_m14)
    self.wpn_fps_ass_m14_secondary.unit = "new_weapon_units/wpn_fps_ass_m14_secondary"

    self.wpn_fps_shot_b682_primary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_shot_b682_primary.unit = "new_weapon_units/wpn_fps_shot_b682_primary"
    self.wpn_fps_shot_b682_secondary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_shot_b682_secondary.unit = "new_weapon_units/wpn_fps_shot_b682_secondary"

    self.wpn_fps_smg_mp9_primary = deep_clone(self.wpn_fps_smg_mp9)
    self.wpn_fps_smg_mp9_primary.unit = "new_weapon_units/wpn_fps_smg_mp9_primary"
    self.wpn_fps_smg_mp9_secondary = deep_clone(self.wpn_fps_smg_mp9)
    self.wpn_fps_smg_mp9_secondary.unit = "new_weapon_units/wpn_fps_smg_mp9_secondary"

    self.wpn_fps_snp_m95_primary = deep_clone(self.wpn_fps_snp_m95)
    self.wpn_fps_snp_m95_primary.unit = "new_weapon_units/wpn_fps_snp_m95_primary"
    self.wpn_fps_snp_m95_secondary = deep_clone(self.wpn_fps_snp_m95)
    self.wpn_fps_snp_m95_secondary.unit = "new_weapon_units/wpn_fps_snp_m95_secondary"
	
	--kurumi send help
    self.wpn_fps_ass_fal_primary = deep_clone(self.wpn_fps_ass_fal)
    self.wpn_fps_ass_fal_primary.unit = "new_weapon_units/wpn_fps_ass_fal_primary"
    self.wpn_fps_ass_fal_secondary = deep_clone(self.wpn_fps_ass_fal)
    self.wpn_fps_ass_fal_secondary.unit = "new_weapon_units/wpn_fps_ass_fal_secondary"
	
    self.wpn_fps_pis_deagle_primary = deep_clone(self.wpn_fps_pis_deagle)
    self.wpn_fps_pis_deagle_primary.unit = "new_weapon_units/wpn_fps_pis_deagle_primary"
    self.wpn_fps_pis_deagle_secondary = deep_clone(self.wpn_fps_pis_deagle)
    self.wpn_fps_pis_deagle_secondary.unit = "new_weapon_units/wpn_fps_pis_deagle_secondary"
	
    self.wpn_fps_ass_aug_primary = deep_clone(self.wpn_fps_ass_aug)
    self.wpn_fps_ass_aug_primary.unit = "new_weapon_units/wpn_fps_ass_aug_primary"
    self.wpn_fps_ass_aug_secondary = deep_clone(self.wpn_fps_ass_aug)
    self.wpn_fps_ass_aug_secondary.unit = "new_weapon_units/wpn_fps_ass_aug_secondary"
	
    self.wpn_fps_smg_p90_primary = deep_clone(self.wpn_fps_smg_p90)
    self.wpn_fps_smg_p90_primary.unit = "new_weapon_units/wpn_fps_smg_p90_primary"
    self.wpn_fps_smg_p90_secondary = deep_clone(self.wpn_fps_smg_p90)
    self.wpn_fps_smg_p90_secondary.unit = "new_weapon_units/wpn_fps_smg_p90_secondary"
	
    self.wpn_fps_sho_striker_primary = deep_clone(self.wpn_fps_sho_striker)
    self.wpn_fps_sho_striker_primary.unit = "new_weapon_units/wpn_fps_sho_striker_primary"
    self.wpn_fps_sho_striker_secondary = deep_clone(self.wpn_fps_sho_striker)
    self.wpn_fps_sho_striker_secondary.unit = "new_weapon_units/wpn_fps_sho_striker_secondary"
	
    self.wpn_fps_ass_amcar_primary = deep_clone(self.wpn_fps_ass_amcar)
    self.wpn_fps_ass_amcar_primary.unit = "new_weapon_units/wpn_fps_ass_amcar_primary"
    self.wpn_fps_ass_amcar_secondary = deep_clone(self.wpn_fps_ass_amcar)
    self.wpn_fps_ass_amcar_secondary.unit = "new_weapon_units/wpn_fps_ass_amcar_secondary"
	
    self.wpn_fps_ass_m16_primary = deep_clone(self.wpn_fps_ass_m16)
    self.wpn_fps_ass_m16_primary.unit = "new_weapon_units/wpn_fps_ass_m16_primary"
    self.wpn_fps_ass_m16_secondary = deep_clone(self.wpn_fps_ass_m16)
    self.wpn_fps_ass_m16_secondary.unit = "new_weapon_units/wpn_fps_ass_m16_secondary"
	
    self.wpn_fps_ass_scar_primary = deep_clone(self.wpn_fps_ass_scar)
    self.wpn_fps_ass_scar_primary.unit = "new_weapon_units/wpn_fps_ass_scar_primary"
    self.wpn_fps_ass_scar_secondary = deep_clone(self.wpn_fps_ass_scar)
    self.wpn_fps_ass_scar_secondary.unit = "new_weapon_units/wpn_fps_ass_scar_secondary"
	
    self.wpn_fps_pis_judge_primary = deep_clone(self.wpn_fps_pis_judge)
    self.wpn_fps_pis_judge_primary.unit = "new_weapon_units/wpn_fps_pis_judge_primary"
    self.wpn_fps_pis_judge_secondary = deep_clone(self.wpn_fps_pis_judge)
    self.wpn_fps_pis_judge_secondary.unit = "new_weapon_units/wpn_fps_pis_judge_secondary"
	
    self.wpn_fps_smg_thompson_primary = deep_clone(self.wpn_fps_smg_thompson)
    self.wpn_fps_smg_thompson_primary.unit = "new_weapon_units/wpn_fps_smg_thompson_primary"
    self.wpn_fps_smg_thompson_secondary = deep_clone(self.wpn_fps_smg_thompson)
    self.wpn_fps_smg_thompson_secondary.unit = "new_weapon_units/wpn_fps_smg_thompson_secondary"
	
    self.wpn_fps_lmg_hk21_primary = deep_clone(self.wpn_fps_lmg_hk21)
    self.wpn_fps_lmg_hk21_primary.unit = "new_weapon_units/wpn_fps_lmg_hk21_primary"
    self.wpn_fps_lmg_hk21_secondary = deep_clone(self.wpn_fps_lmg_hk21)
    self.wpn_fps_lmg_hk21_secondary.unit = "new_weapon_units/wpn_fps_lmg_hk21_secondary"
	
    self.wpn_fps_lmg_m249_primary = deep_clone(self.wpn_fps_lmg_m249)
    self.wpn_fps_lmg_m249_primary.unit = "new_weapon_units/wpn_fps_lmg_m249_primary"
    self.wpn_fps_lmg_m249_secondary = deep_clone(self.wpn_fps_lmg_m249)
    self.wpn_fps_lmg_m249_secondary.unit = "new_weapon_units/wpn_fps_lmg_m249_secondary"
	
    self.wpn_fps_pis_rage_primary = deep_clone(self.wpn_fps_pis_rage)
    self.wpn_fps_pis_rage_primary.unit = "new_weapon_units/wpn_fps_pis_rage_primary"
    self.wpn_fps_pis_rage_secondary = deep_clone(self.wpn_fps_pis_rage)
    self.wpn_fps_pis_rage_secondary.unit = "new_weapon_units/wpn_fps_pis_rage_secondary"
	
    self.wpn_fps_pis_peacemaker_primary = deep_clone(self.wpn_fps_pis_peacemaker)
    self.wpn_fps_pis_peacemaker_primary.unit = "new_weapon_units/wpn_fps_pis_peacemaker_primary"
    self.wpn_fps_pis_peacemaker_secondary = deep_clone(self.wpn_fps_pis_peacemaker)
    self.wpn_fps_pis_peacemaker_secondary.unit = "new_weapon_units/wpn_fps_pis_peacemaker_secondary"
	
    self.wpn_fps_ass_flint_primary = deep_clone(self.wpn_fps_ass_flint)
    self.wpn_fps_ass_flint_primary.unit = "new_weapon_units/wpn_fps_ass_flint_primary"
    self.wpn_fps_ass_flint_secondary = deep_clone(self.wpn_fps_ass_flint)
    self.wpn_fps_ass_flint_secondary.unit = "new_weapon_units/wpn_fps_ass_flint_secondary"
	
    self.wpn_fps_pis_breech_primary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_pis_breech_primary.unit = "new_weapon_units/wpn_fps_pis_breech_primary"
    self.wpn_fps_pis_breech_secondary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_pis_breech_secondary.unit = "new_weapon_units/wpn_fps_pis_breech_secondary"

    self.wpn_fps_spe_rpg7_primary = deep_clone(self.wpn_fps_rpg7)
    self.wpn_fps_spe_rpg7_primary.unit = "new_weapon_units/wpn_fps_spe_rpg7_primary"
    self.wpn_fps_spe_rpg7_secondary = deep_clone(self.wpn_fps_rpg7)
    self.wpn_fps_spe_rpg7_secondary.unit = "new_weapon_units/wpn_fps_spe_rpg7_secondary"
	
	--I should go make more Nepgear shovel pics
	self.wpn_fps_ass_74_primary = deep_clone(self.wpn_fps_ass_74)
    self.wpn_fps_ass_74_primary.unit = "new_weapon_units/wpn_fps_ass_74_primary"
    self.wpn_fps_ass_74_secondary = deep_clone(self.wpn_fps_ass_74)
    self.wpn_fps_ass_74_secondary.unit = "new_weapon_units/wpn_fps_ass_74_secondary"
	
	self.wpn_fps_ass_ching_primary = deep_clone(self.wpn_fps_ass_ching)
    self.wpn_fps_ass_ching_primary.unit = "new_weapon_units/wpn_fps_ass_ching_primary"
    self.wpn_fps_ass_ching_secondary = deep_clone(self.wpn_fps_ass_ching)
    self.wpn_fps_ass_ching_secondary.unit = "new_weapon_units/wpn_fps_ass_ching_secondary"
	
	self.wpn_fps_pis_lemming_primary = deep_clone(self.wpn_fps_pis_lemming)
    self.wpn_fps_pis_lemming_primary.unit = "new_weapon_units/wpn_fps_pis_lemming_primary"
    self.wpn_fps_pis_lemming_secondary = deep_clone(self.wpn_fps_pis_lemming)
    self.wpn_fps_pis_lemming_secondary.unit = "new_weapon_units/wpn_fps_pis_lemming_secondary"
	
	self.wpn_fps_shot_m37_primary = deep_clone(self.wpn_fps_shot_m37)
    self.wpn_fps_shot_m37_primary.unit = "new_weapon_units/wpn_fps_shot_m37_primary"
    self.wpn_fps_shot_m37_secondary = deep_clone(self.wpn_fps_shot_m37)
    self.wpn_fps_shot_m37_secondary.unit = "new_weapon_units/wpn_fps_shot_m37_secondary"
	
	self.wpn_fps_shot_r870_primary = deep_clone(self.wpn_fps_shot_r870)
    self.wpn_fps_shot_r870_primary.unit = "new_weapon_units/wpn_fps_shot_r870_primary"
    self.wpn_fps_shot_r870_secondary = deep_clone(self.wpn_fps_shot_r870)
    self.wpn_fps_shot_r870_secondary.unit = "new_weapon_units/wpn_fps_shot_r870_secondary"
	
	self.wpn_fps_smg_erma_primary = deep_clone(self.wpn_fps_smg_erma)
    self.wpn_fps_smg_erma_primary.unit = "new_weapon_units/wpn_fps_smg_erma_primary"
    self.wpn_fps_smg_erma_secondary = deep_clone(self.wpn_fps_smg_erma)
    self.wpn_fps_smg_erma_secondary.unit = "new_weapon_units/wpn_fps_smg_erma_secondary"
	
	self.wpn_fps_smg_schakal_primary = deep_clone(self.wpn_fps_smg_schakal)
    self.wpn_fps_smg_schakal_primary.unit = "new_weapon_units/wpn_fps_smg_schakal_primary"
    self.wpn_fps_smg_schakal_secondary = deep_clone(self.wpn_fps_smg_schakal)
    self.wpn_fps_smg_schakal_secondary.unit = "new_weapon_units/wpn_fps_smg_schakal_secondary"
	
	self.wpn_fps_smg_tec9_primary = deep_clone(self.wpn_fps_smg_tec9)
    self.wpn_fps_smg_tec9_primary.unit = "new_weapon_units/wpn_fps_smg_tec9_primary"
    self.wpn_fps_smg_tec9_secondary = deep_clone(self.wpn_fps_smg_tec9)
    self.wpn_fps_smg_tec9_secondary.unit = "new_weapon_units/wpn_fps_smg_tec9_secondary"

    self.wpn_fps_snp_msr_primary = deep_clone(self.wpn_fps_snp_msr)
    self.wpn_fps_snp_msr_primary.unit = "new_weapon_units/wpn_fps_snp_msr_primary"
    self.wpn_fps_snp_msr_secondary = deep_clone(self.wpn_fps_snp_msr)
    self.wpn_fps_snp_msr_secondary.unit = "new_weapon_units/wpn_fps_snp_msr_secondary"

    self.wpn_fps_sho_deamon_primary = deep_clone(self.wpn_fps_sho_boot)
    self.wpn_fps_sho_deamon_primary.unit = "new_weapon_units/wpn_fps_sho_deamon_primary"
    self.wpn_fps_sho_deamon_secondary = deep_clone(self.wpn_fps_sho_boot)
    self.wpn_fps_sho_deamon_secondary.unit = "new_weapon_units/wpn_fps_sho_deamon_secondary"
end

function WeaponFactoryTweakData:_init_upgraded_multiplix()
    self.wpn_fps_ass_m14_upg_primary = deep_clone(self.wpn_fps_ass_m14)
    self.wpn_fps_ass_m14_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m14_upg_primary"
    self.wpn_fps_ass_m14_upg_primary.default_blueprint = {
        "wpn_fps_ass_m14_b_standard",
        "wpn_fps_ass_m14_body_lower",
        "wpn_fps_ass_m14_body_upper",
        "wpn_fps_ass_m14_body_jae",
        "wpn_fps_ass_m14_m_standard",
        "wpn_fps_upg_o_reflex",
        "wpn_fps_upg_o_m14_scopemount",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_m14_upg_secondary = deep_clone(self.wpn_fps_ass_m14_upg_primary)
    self.wpn_fps_ass_m14_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m14_upg_secondary"

    self.wpn_fps_snp_m95_upg_primary = deep_clone(self.wpn_fps_snp_m95)
    self.wpn_fps_snp_m95_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_snp_m95_upg_primary"
    self.wpn_fps_snp_m95_upg_primary.default_blueprint = {
        "wpn_fps_snp_m95_barrel_long",
        "wpn_fps_snp_m95_bipod",
        "wpn_fps_snp_m95_lower_reciever",
        "wpn_fps_snp_m95_upper_reciever",
        "wpn_fps_snp_m95_magazine",
        "wpn_fps_upg_o_leupold",
        "wpn_fps_upg_m4_g_standard_vanilla"
    }
    self.wpn_fps_snp_m95_upg_secondary = deep_clone(self.wpn_fps_snp_m95_upg_primary)
    self.wpn_fps_snp_m95_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_snp_m95_upg_secondary"

    self.wpn_fps_pis_1911_upg_primary = deep_clone(self.wpn_fps_pis_1911)
    self.wpn_fps_pis_1911_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_1911_upg_primary"
    self.wpn_fps_pis_1911_upg_primary.default_blueprint = {
        "wpn_fps_pis_1911_body_standard",
        "wpn_fps_pis_1911_b_long",
        "wpn_fps_pis_1911_g_engraved",
        "wpn_fps_pis_1911_m_standard",
        "wpn_upg_o_marksmansight_rear",
        "wpn_fps_upg_fl_pis_laser"
    }
    self.wpn_fps_pis_1911_upg_secondary = deep_clone(self.wpn_fps_pis_1911_upg_primary)
    self.wpn_fps_pis_1911_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_1911_upg_secondary"

    self.wpn_fps_shot_b682_upg_primary = deep_clone(self.wpn_fps_shot_b682)
    self.wpn_fps_shot_b682_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_shot_b682_upg_primary"
    self.wpn_fps_shot_b682_upg_primary.default_blueprint = {
        "wpn_fps_shot_b682_body_standard",
        "wpn_fps_shot_b682_b_long",
        "wpn_fps_shot_b682_s_ammopouch",
        "wpn_fps_upg_a_dragons_breath"
    }
    self.wpn_fps_shot_b682_upg_secondary = deep_clone(self.wpn_fps_shot_b682_upg_primary)
    self.wpn_fps_shot_b682_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_shot_b682_upg_secondary"

    self.wpn_fps_smg_mp9_upg_primary = deep_clone(self.wpn_fps_smg_mp9)
    self.wpn_fps_smg_mp9_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_mp9_upg_primary"
    self.wpn_fps_smg_mp9_upg_primary.default_blueprint = {
        "wpn_fps_smg_mp9_body_mp9",
        "wpn_fps_smg_mp9_s_skel",
        "wpn_fps_smg_mp9_m_extended",
        "wpn_fps_smg_mp9_b_dummy",
        "wpn_fps_upg_ass_ns_battle",
        "wpn_fps_upg_vg_ass_smg_verticalgrip",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_smg_mp9_upg_secondary = deep_clone(self.wpn_fps_smg_mp9_upg_primary)
    self.wpn_fps_smg_mp9_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_mp9_upg_secondary"
	

	--upgrade my shovel
    self.wpn_fps_ass_fal_upg_primary = deep_clone(self.wpn_fps_ass_fal)
    self.wpn_fps_ass_fal_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_fal_upg_primary"
    self.wpn_fps_ass_fal_upg_primary.default_blueprint = {
        "wpn_fps_ass_fal_body_standard",
        "wpn_fps_ass_fal_fg_04",
        "wpn_fps_ass_fal_g_01",
        "wpn_fps_ass_fal_m_01",
        "wpn_fps_ass_fal_s_wood",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_fal_upg_secondary = deep_clone(self.wpn_fps_ass_fal_upg_primary)
    self.wpn_fps_ass_fal_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_fal_upg_secondary"
	
    self.wpn_fps_pis_deagle_upg_primary = deep_clone(self.wpn_fps_pis_deagle)
    self.wpn_fps_pis_deagle_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_deagle_upg_primary"
    self.wpn_fps_pis_deagle_upg_primary.default_blueprint = {
        "wpn_fps_pis_deagle_body_standard",
        "wpn_fps_pis_deagle_b_modern",
        "wpn_fps_pis_deagle_g_bling",
        "wpn_fps_pis_deagle_m_extended",
        "wpn_fps_upg_fl_pis_laser"
    }
    self.wpn_fps_pis_deagle_upg_secondary = deep_clone(self.wpn_fps_pis_deagle_upg_primary)
    self.wpn_fps_pis_deagle_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_deagle_upg_secondary"
	
    self.wpn_fps_ass_aug_upg_primary = deep_clone(self.wpn_fps_ass_aug)
    self.wpn_fps_ass_aug_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_aug_upg_primary"
    self.wpn_fps_ass_aug_upg_primary.default_blueprint = {
        "wpn_fps_aug_body_aug",
        "wpn_fps_aug_b_long",
        "wpn_fps_aug_fg_a3",
        "wpn_fps_upg_vg_ass_smg_verticalgrip",
        "wpn_fps_aug_m_pmag",
        "wpn_upg_o_marksmansight_rear_vanilla",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_aug_upg_secondary = deep_clone(self.wpn_fps_ass_aug_upg_primary)
    self.wpn_fps_ass_aug_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_aug_upg_secondary"
	
    self.wpn_fps_smg_p90_upg_primary = deep_clone(self.wpn_fps_smg_p90)
    self.wpn_fps_smg_p90_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_p90_upg_primary"
    self.wpn_fps_smg_p90_upg_primary.default_blueprint = {
        "wpn_fps_smg_p90_body_boxy",
        "wpn_fps_smg_p90_b_long",
        "wpn_fps_smg_p90_m_strap",
        "wpn_upg_o_marksmansight_rear_vanilla",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_smg_p90_upg_secondary = deep_clone(self.wpn_fps_smg_p90_upg_primary)
    self.wpn_fps_smg_p90_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_p90_upg_secondary"
	
    self.wpn_fps_sho_striker_upg_primary = deep_clone(self.wpn_fps_sho_striker)
    self.wpn_fps_sho_striker_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_sho_striker_upg_primary"
    self.wpn_fps_sho_striker_upg_primary.default_blueprint = {
        "wpn_fps_sho_striker_b_long",
        "wpn_fps_sho_striker_body_standard",
        "wpn_upg_o_marksmansight_rear_vanilla",
        "wpn_fps_upg_shot_ns_king",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_sho_striker_upg_secondary = deep_clone(self.wpn_fps_sho_striker_upg_primary)
    self.wpn_fps_sho_striker_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_sho_striker_upg_secondary"
	
    self.wpn_fps_ass_amcar_upg_primary = deep_clone(self.wpn_fps_ass_amcar)
    self.wpn_fps_ass_amcar_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_amcar_upg_primary"
    self.wpn_fps_ass_amcar_upg_primary.default_blueprint = {
        "wpn_fps_m4_uupg_b_medium_vanilla",
        "wpn_fps_m4_lower_reciever",
        "wpn_fps_amcar_uupg_body_upperreciever",
        "wpn_fps_amcar_uupg_fg_amcar",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_m4_m_quad",
        "wpn_fps_upg_m4_s_ubr",
        "wpn_fps_upg_fl_ass_laser",
        "wpn_fps_upg_m4_g_standard_vanilla",
        "wpn_fps_amcar_bolt_standard"
    }
    self.wpn_fps_ass_amcar_upg_secondary = deep_clone(self.wpn_fps_ass_amcar_upg_primary)
    self.wpn_fps_ass_amcar_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_amcar_upg_secondary"
	
    self.wpn_fps_ass_m16_upg_primary = deep_clone(self.wpn_fps_ass_m16)
    self.wpn_fps_ass_m16_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m16_upg_primary"
    self.wpn_fps_ass_m16_upg_primary.default_blueprint = {
        "wpn_fps_m4_lower_reciever",
        "wpn_fps_m4_upper_reciever_round",
        "wpn_fps_m4_uupg_draghandle",
        "wpn_fps_upg_m4_m_straight_vanilla",
        "wpn_fps_snp_tti_g_grippy",
        "wpn_fps_m16_fg_railed",
        "wpn_fps_m4_uupg_b_long",
        "wpn_fps_ass_m16_o_handle_sight",
        "wpn_fps_snp_tti_s_vltor",
        "wpn_fps_amcar_bolt_standard",
        "wpn_fps_upg_fl_ass_laser",
        "wpn_fps_upg_ns_ass_smg_stubby"
    }
    self.wpn_fps_ass_m16_upg_secondary = deep_clone(self.wpn_fps_ass_m16_upg_primary)
    self.wpn_fps_ass_m16_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_m16_upg_secondary"
	
    self.wpn_fps_ass_scar_upg_primary = deep_clone(self.wpn_fps_ass_scar)
    self.wpn_fps_ass_scar_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_scar_upg_primary"
    self.wpn_fps_ass_scar_upg_primary.default_blueprint = {
        "wpn_fps_ass_scar_m_standard",
        "wpn_fps_ass_scar_b_long",
        "wpn_fps_ass_scar_body_standard",
        "wpn_fps_ass_scar_s_sniper",
        "wpn_fps_ass_scar_o_flipups_up",
        "wpn_fps_upg_m4_g_sniper",
        "wpn_fps_upg_vg_ass_smg_afg",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_ass_scar_upg_secondary = deep_clone(self.wpn_fps_ass_scar_upg_primary)
    self.wpn_fps_ass_scar_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_scar_upg_secondary"
	
    self.wpn_fps_pis_judge_upg_primary = deep_clone(self.wpn_fps_pis_judge)
    self.wpn_fps_pis_judge_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_judge_upg_primary"
    self.wpn_fps_pis_judge_upg_secondary = deep_clone(self.wpn_fps_pis_judge_upg_primary)
    self.wpn_fps_pis_judge_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_judge_upg_secondary"
	
    self.wpn_fps_smg_thompson_upg_primary = deep_clone(self.wpn_fps_smg_thompson)
    self.wpn_fps_smg_thompson_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_thompson_upg_primary"
    self.wpn_fps_smg_thompson_upg_secondary = deep_clone(self.wpn_fps_smg_thompson_upg_primary)
    self.wpn_fps_smg_thompson_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_thompson_upg_secondary"
	
    self.wpn_fps_lmg_hk21_upg_primary = deep_clone(self.wpn_fps_lmg_hk21)
    self.wpn_fps_lmg_hk21_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_hk21_upg_primary"
    self.wpn_fps_lmg_hk21_upg_primary.default_blueprint = {
        "wpn_fps_lmg_hk21_b_long",
        "wpn_fps_lmg_hk21_body_lower",
        "wpn_fps_lmg_hk21_body_upper",
        "wpn_fps_lmg_hk21_fg_long",
        "wpn_fps_lmg_hk21_g_ergo",
        "wpn_fps_lmg_hk21_m_standard",
        "wpn_fps_lmg_hk21_s_standard",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_lmg_hk21_upg_secondary = deep_clone(self.wpn_fps_lmg_hk21_upg_primary)
    self.wpn_fps_lmg_hk21_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_hk21_upg_secondary"
	
    self.wpn_fps_lmg_m249_upg_primary = deep_clone(self.wpn_fps_lmg_m249)
    self.wpn_fps_lmg_m249_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_m249_upg_primary"
    self.wpn_fps_lmg_m249_upg_primary.default_blueprint = {
        "wpn_fps_lmg_m249_b_long",
        "wpn_fps_lmg_m249_body_standard",
        "wpn_fps_lmg_m249_fg_mk46",
        "wpn_fps_lmg_m249_m_standard",
        "wpn_fps_lmg_m249_s_solid",
        "wpn_fps_lmg_m249_upper_reciever",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_lmg_m249_upg_secondary = deep_clone(self.wpn_fps_lmg_m249_upg_primary)
    self.wpn_fps_lmg_m249_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_lmg_m249_upg_secondary"
	
    self.wpn_fps_pis_rage_upg_primary = deep_clone(self.wpn_fps_pis_rage)
    self.wpn_fps_pis_rage_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_rage_upg_primary"
    self.wpn_fps_pis_rage_upg_primary.default_blueprint = {
        "wpn_fps_pis_rage_body_standard",
        "wpn_fps_pis_rage_b_long",
        "wpn_fps_pis_rage_g_ergo"
    }
    self.wpn_fps_pis_rage_upg_secondary = deep_clone(self.wpn_fps_pis_rage_upg_primary)
    self.wpn_fps_pis_rage_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_rage_upg_secondary"
	
    self.wpn_fps_pis_peacemaker_upg_primary = deep_clone(self.wpn_fps_pis_peacemaker)
    self.wpn_fps_pis_peacemaker_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_peacemaker_upg_primary"
    self.wpn_fps_pis_peacemaker_upg_secondary = deep_clone(self.wpn_fps_pis_peacemaker_upg_primary)
    self.wpn_fps_pis_peacemaker_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_peacemaker_upg_secondary"
	
    self.wpn_fps_ass_flint_upg_primary = deep_clone(self.wpn_fps_ass_flint)
    self.wpn_fps_ass_flint_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_flint_upg_primary"
    self.wpn_fps_ass_flint_upg_primary.default_blueprint = {
        "wpn_fps_ass_flint_b_standard",
        "wpn_fps_ass_flint_body_upperreceiver",
        "wpn_fps_upg_ak_m_uspalm",
        "wpn_fps_ass_flint_fg_standard",
        "wpn_fps_ass_flint_dh_standard",
        "wpn_fps_upg_ns_ass_smg_tank",
        "wpn_fps_ass_flint_o_standard",
        "wpn_fps_snp_tti_s_vltor",
        "wpn_fps_upg_ak_g_pgrip",
        "wpn_fps_ass_flint_m_release_standard"
    }
    self.wpn_fps_ass_flint_upg_secondary = deep_clone(self.wpn_fps_ass_flint_upg_primary)
    self.wpn_fps_ass_flint_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_flint_upg_secondary"
	
    self.wpn_fps_pis_breech_upg_primary = deep_clone(self.wpn_fps_pis_breech)
    self.wpn_fps_pis_breech_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_breech_upg_primary"
    self.wpn_fps_pis_breech_upg_secondary = deep_clone(self.wpn_fps_pis_breech_upg_primary)
    self.wpn_fps_pis_breech_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_breech_upg_secondary"
	
	--shovel upgrade mkII
    self.wpn_fps_ass_74_upg_primary = deep_clone(self.wpn_fps_ass_74)
    self.wpn_fps_ass_74_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_74_upg_primary"
    self.wpn_fps_ass_74_upg_secondary = deep_clone(self.wpn_fps_ass_74_upg_primary)
    self.wpn_fps_ass_74_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_74_upg_secondary"
	
    self.wpn_fps_ass_ching_upg_primary = deep_clone(self.wpn_fps_ass_ching)
    self.wpn_fps_ass_ching_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_ass_ching_upg_primary"
    self.wpn_fps_ass_ching_upg_secondary = deep_clone(self.wpn_fps_ass_ching_upg_primary)
    self.wpn_fps_ass_ching_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_ass_ching_upg_secondary"
    
    self.wpn_fps_pis_lemming_upg_primary = deep_clone(self.wpn_fps_pis_lemming)
    self.wpn_fps_pis_lemming_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_pis_lemming_upg_primary"
    self.wpn_fps_pis_lemming_upg_secondary = deep_clone(self.wpn_fps_pis_lemming_upg_primary)
    self.wpn_fps_pis_lemming_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_pis_lemming_upg_secondary"
    
    self.wpn_fps_shot_m37_upg_primary = deep_clone(self.wpn_fps_shot_m37)
    self.wpn_fps_shot_m37_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_shot_m37_upg_primary"
    self.wpn_fps_shot_m37_upg_secondary = deep_clone(self.wpn_fps_shot_m37_upg_primary)
    self.wpn_fps_shot_m37_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_shot_m37_upg_secondary"
    
    self.wpn_fps_shot_r870_upg_primary = deep_clone(self.wpn_fps_shot_r870)
    self.wpn_fps_shot_r870_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_shot_r870_upg_primary"
    self.wpn_fps_shot_r870_upg_secondary = deep_clone(self.wpn_fps_shot_r870_upg_primary)
    self.wpn_fps_shot_r870_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_shot_r870_upg_secondary"
    
    self.wpn_fps_smg_erma_upg_primary = deep_clone(self.wpn_fps_smg_erma)
    self.wpn_fps_smg_erma_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_erma_upg_primary"
    self.wpn_fps_smg_erma_upg_secondary = deep_clone(self.wpn_fps_smg_erma_upg_primary)
    self.wpn_fps_smg_erma_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_erma_upg_secondary"
    
    self.wpn_fps_smg_schakal_upg_primary = deep_clone(self.wpn_fps_smg_schakal)
    self.wpn_fps_smg_schakal_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_schakal_upg_primary"
    self.wpn_fps_smg_schakal_upg_secondary = deep_clone(self.wpn_fps_smg_schakal_upg_primary)
    self.wpn_fps_smg_schakal_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_schakal_upg_secondary"
    
    self.wpn_fps_smg_tec9_upg_primary = deep_clone(self.wpn_fps_smg_tec9)
    self.wpn_fps_smg_tec9_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_smg_tec9_upg_primary"
    self.wpn_fps_smg_tec9_upg_secondary = deep_clone(self.wpn_fps_smg_tec9_upg_primary)
    self.wpn_fps_smg_tec9_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_smg_tec9_upg_secondary"

    self.wpn_fps_spe_rpg7_upg_primary = deep_clone(self.wpn_fps_rpg7)
    self.wpn_fps_spe_rpg7_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_spe_rpg7_upg_primary"
    self.wpn_fps_spe_rpg7_upg_secondary = deep_clone(self.wpn_fps_spe_rpg7_upg_primary)
    self.wpn_fps_spe_rpg7_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_spe_rpg7_upg_secondary"

    self.wpn_fps_snp_msr_upg_primary = deep_clone(self.wpn_fps_snp_msr)
    self.wpn_fps_snp_msr_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_snp_msr_upg_primary"
    self.wpn_fps_snp_msr_upg_primary.default_blueprint = {
        "wpn_fps_snp_msr_b_long",
        "wpn_fps_snp_msr_body_msr",
        "wpn_fps_snp_msr_m_standard",
        "wpn_fps_upg_o_leupold",
        "wpn_fps_upg_fl_ass_laser"
    }
    self.wpn_fps_snp_msr_upg_secondary = deep_clone(self.wpn_fps_snp_msr_upg_primary)
    self.wpn_fps_snp_msr_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_snp_msr_upg_secondary"

    self.wpn_fps_spe_vulcan_upg_primary = deep_clone(self.wpn_fps_lmg_shuno)
    self.wpn_fps_spe_vulcan_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_spe_vulcan_upg_primary"

    self.wpn_fps_sho_deamon_upg_primary = deep_clone(self.wpn_fps_sho_boot)
    self.wpn_fps_sho_deamon_upg_primary.unit = "new_weapon_units/upgrade/wpn_fps_sho_deamon_upg_primary"
    self.wpn_fps_sho_deamon_upg_primary.default_blueprint = {
        "wpn_fps_sho_boot_b_legendary",
        "wpn_fps_sho_boot_fg_legendary",
        "wpn_fps_sho_boot_o_legendary",
        "wpn_fps_sho_boot_s_legendary",
        "wpn_fps_sho_boot_body_standard",
        "wpn_fps_sho_boot_em_extra",
        "wpn_fps_sho_boot_m_standard",
        "wpn_fps_upg_a_custom_free"
    }
    self.wpn_fps_sho_deamon_upg_secondary = deep_clone(self.wpn_fps_sho_deamon_upg_primary)
    self.wpn_fps_sho_deamon_upg_secondary.unit = "new_weapon_units/upgrade/wpn_fps_sho_deamon_upg_secondary"
end