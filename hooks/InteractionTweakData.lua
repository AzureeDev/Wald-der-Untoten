Hooks:PostHook(InteractionTweakData, "init", "zm_init_new_interactions", function(self, tweak_data)
    self.zm_wall_buy_falcon_1200 = {
        text_id = "zm_buy_falcon_1200",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
    }

    self.zm_wall_buy_joceline_1600 = {
        text_id = "zm_wall_buy_joceline_1600",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
    }

    self.zm_wall_buy_m14_2000 = {
        text_id = "zm_wall_buy_m14_2000",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}
	
	self.zm_wall_buy_r870_1300 = {
        text_id = "zm_wall_buy_r870_1300",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}
	
	self.zm_wall_buy_tec9_800 = {
		text_id = "zm_wall_buy_tec9_800",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}

	self.zm_wall_buy_57_1000 = {
		text_id = "zm_wall_buy_57_1000",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}
	
	self.zm_wall_buy_ump45_1450 = {
		text_id = "zm_wall_buy_ump45_1450",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}

	self.zm_wall_buy_m37_1300 = {
		text_id = "zm_wall_buy_m37_1300",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}

    self.zm_pack_a_punch = {
        text_id = "zm_pack_a_punch",
		action_text_id = "zm_upgrade_weapon",
		start_active = false,
		axis = "y",
		timer = 4
    }

    self.zm_open_path_1000 = {
        text_id = "zm_open_path_1000",
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 1300
	}

	self.zm_open_path_1000_nrm = {
		text_id = "zm_open_path_1000",
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 500
	}

	self.zm_open_path_2000 = {
		text_id = "zm_open_path_2000",
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 700
	}

	self.zm_open_path_2000_exp = {
		text_id = "zm_open_path_2000",
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 1300
	}
	
	self.zm_wall_buy_mp9_2500 = {
        text_id = "zm_wall_buy_mp9_2500",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}
	
	self.zm_mystery_box = {
		text_id = "zm_mystery_box_950",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 4
	}

	self.zm_mystery_box_fs = {
		text_id = "zm_mystery_box_10",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 4
	}

	self.zm_perk_juggernog = {
		text_id = "zm_perk_juggernog_2500",
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_juggernog",
		is_perk_interaction = true
	}

	self.zm_perk_speedcola = {
		text_id = "zm_perk_speedcola_3000",
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",
		special_equipment_block = "perk_speedcola",
		is_perk_interaction = true
	}

	self.zm_perk_doubletap = {
		text_id = "zm_perk_doubletap_2000",
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_doubletap",
		is_perk_interaction = true
	}

	self.zm_perk_quickrevive = {
		text_id = "zm_perk_quickrevive_1500",
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_quickrevive",
		is_perk_interaction = true
	}

	self.zm_perk_quickrevive_solo = {
		text_id = "zm_perk_quickrevive_solo",
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment_block = "perk_quickrevive",
		is_perk_interaction = true
	}

	self.zm_open_door_2000 = {
		text_id = "zm_open_door_2000",
		action_text_id = "zm_opening_path",
		start_active = false,
		axis = "y",
		timer = 4
	}

	self.zm_teleporter = {
		is_teleporter = true,
		text_id = "zm_teleporter",
		action_text_id = "zm_use_teleporter",
		start_active = false,
		timer = 1,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",
		interact_distance = 500
	}

	self.zm_teleporter_dummy_reload = {
		text_id = "zm_teleporter_cooling_down",
		start_active = false,
		special_equipment = "zm_dummy_item",
		equipment_text_id = "zm_teleporter_cooling_down",
		interact_distance = 500
	}

	self.zm_activate_song_invisible = {
		text_id = "zm_activate_song_invisible",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		interact_distance = 250
	}

	self.zm_wall_buy_ak47_2000 = {
		text_id = "zm_wall_buy_ak47_2000",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}

	self.zm_wall_buy_mp40_1100 = {
		text_id = "zm_wall_buy_mp40_1100",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}

	self.zm_wall_buy_garand_1500 = {
		text_id = "zm_wall_buy_garand_1500",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}

	self.zm_wall_buy_nades_1000 = {
		text_id = "zm_wall_buy_nades_1000",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 1.5
	}
end)
