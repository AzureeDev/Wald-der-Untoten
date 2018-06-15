Hooks:PostHook(InteractionTweakData, "init", "zm_init_new_interactions", function(self, tweak_data)
    self.zm_wall_buy_m14_2000 = {
		zm_interaction = true,
		weapon = "M308 Rifle",
		weapon_id = "new_m14",
		points_cost = 1350,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_joceline_1600 = {
		zm_interaction = true,
		weapon = "Joceline Shotgun",
		weapon_id = "b682",
		points_cost = 500,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_r870_1300 = {
		zm_interaction = true,
		weapon = "Reinfeld 880 Shotgun",
		weapon_id = "r870",
		points_cost = 1200,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_57_1000 = {
		zm_interaction = true,
		weapon = "5/7 Pistol",
		weapon_id = "lemming",
		points_cost = 850,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_ump45_1450 = {
		zm_interaction = true,
		weapon = "Jackal SMG",
		weapon_id = "schakal",
		points_cost = 1400,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_m37_1300 = {
		zm_interaction = true,
		weapon = "GSPS Shotgun",
		weapon_id = "m37",
		points_cost = 1350,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_mp9_2500 = {
		zm_interaction = true,
		weapon = "MP9 Submachine Gun",
		weapon_id = "mp9",
		points_cost = 1000,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_ak47_2000 = {
		zm_interaction = true,
		weapon = "AK Rifle",
		weapon_id = "ak74",
		points_cost = 1800,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_mp40_1100 = {
		zm_interaction = true,
		weapon = "MP40 SMG",
		weapon_id = "erma",
		points_cost = 1300,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_garand_1500 = {
		zm_interaction = true,
		weapon = "Galant Rifle",
		weapon_id = "ching",
		points_cost = 500,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_wall_buy_nades_1000 = {
		zm_interaction = true,
		weapon = "Grenades",
		grenade_spot = true,
		points_cost = 1000,
		stay_active = true,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 0.5
	}

	self.zm_pack_a_punch = {
		zm_interaction = true,
		pack_a_punch = true,
		points_cost = 5000,
		stay_active = true,
		action_text_id = "zm_upgrade_weapon",
		start_active = false,
		axis = "y",
		timer = 4
	}
	
	self.zm_open_path_1000 = {
		zm_interaction = true,
		path = true,
		points_cost = 1000,
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 1300
	}

	self.zm_open_path_1000_nrm = {
		zm_interaction = true,
		path = true,
		points_cost = 1000,
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 500
	}

	self.zm_open_path_2000 = {
		zm_interaction = true,
		path = true,
		points_cost = 2000,
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 700
	}

	self.zm_open_path_2000_exp = {
		zm_interaction = true,
		path = true,
		points_cost = 2000,
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5,
        interact_distance = 1300
	}

	self.zm_open_door_2000 = {
		zm_interaction = true,
		path = true,
		custom_path = "the door",
		points_cost = 2000,
		action_text_id = "zm_opening_path",
		start_active = false,
		timer = 1.5
	}

	self.zm_mystery_box = {
		zm_interaction = true,
		mystery_box = true,
		points_cost = 950,
		action_text_id = "zm_buy_weapon",
		start_active = false,
		axis = "y",
		timer = 4
	}

	self.zm_activate_song_invisible = {
		text_id = "zm_activate_song_invisible",
		action_text_id = "zm_buy_weapon",
		start_active = false,
		interact_distance = 250
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

	self.zm_perk_juggernog = {
		zm_interaction = true,
		points_cost = 2500,
		perk = "Juggernog",
		is_perk_interaction = true,
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_juggernog"
	}

	self.zm_perk_speedcola = {
		zm_interaction = true,
		points_cost = 3000,
		perk = "Speed Cola",
		is_perk_interaction = true,
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_speedcola"
	}

	self.zm_perk_doubletap = {
		zm_interaction = true,
		points_cost = 2000,
		perk = "Double Tap",
		is_perk_interaction = true,
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_doubletap"
	}

	self.zm_perk_quickrevive = {
		zm_interaction = true,
		points_cost = 1500,
		perk = "Quick Revive",
		is_perk_interaction = true,
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_quickrevive"
	}

	self.zm_perk_quickrevive_solo = {
		zm_interaction = true,
		points_cost = 500,
		perk = "Quick Revive",
		is_perk_interaction = true,
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment_block = "perk_quickrevive"
	}

	self.zm_perk_deadshot = {
		zm_interaction = true,
		points_cost = 4000,
		perk = "Dead Shot",
		is_perk_interaction = true,
		action_text_id = "zm_buy_perk",
		start_active = false,
		axis = "y",
		timer = 3,
		special_equipment = "zm_power_on",
		equipment_text_id = "zm_no_power",		
		special_equipment_block = "perk_deadshot"
	}
end)