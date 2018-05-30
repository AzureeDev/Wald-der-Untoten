function CharacterTweakData:_multiply_by_wave_nb(wave)

	if wave < 10 then
		local addition = 10
		self.fbi.HEALTH_INIT = self.fbi.HEALTH_INIT + addition
		self.swat.HEALTH_INIT = self.swat.HEALTH_INIT + addition
		self.heavy_swat.HEALTH_INIT = self.heavy_swat.HEALTH_INIT + addition
		self.fbi_heavy_swat.HEALTH_INIT = self.fbi_heavy_swat.HEALTH_INIT + addition
		self.sniper.HEALTH_INIT = self.sniper.HEALTH_INIT + addition
		self.gangster.HEALTH_INIT = self.gangster.HEALTH_INIT + addition
		self.biker.HEALTH_INIT = self.biker.HEALTH_INIT + addition
		self.tank.HEALTH_INIT = self.tank.HEALTH_INIT + addition
		self.tank_mini.HEALTH_INIT = self.tank_mini.HEALTH_INIT + addition
		self.tank_medic.HEALTH_INIT = self.tank_medic.HEALTH_INIT + addition
		self.spooc.HEALTH_INIT = self.spooc.HEALTH_INIT + addition
		self.shield.HEALTH_INIT = self.shield.HEALTH_INIT + addition
		self.phalanx_minion.HEALTH_INIT = self.phalanx_minion.HEALTH_INIT + addition
		self.phalanx_vip.HEALTH_INIT = self.phalanx_vip.HEALTH_INIT + addition
		self.taser.HEALTH_INIT = self.taser.HEALTH_INIT + addition
		self.city_swat.HEALTH_INIT = self.city_swat.HEALTH_INIT + addition
		self.biker_escape.HEALTH_INIT = self.biker_escape.HEALTH_INIT + addition
		self.fbi_swat.HEALTH_INIT = self.fbi_swat.HEALTH_INIT + addition
		self.tank_hw.HEALTH_INIT = self.tank_hw.HEALTH_INIT + addition
		self.medic.HEALTH_INIT = self.medic.HEALTH_INIT + addition
		self.bolivian.HEALTH_INIT = self.bolivian.HEALTH_INIT + addition
		self.bolivian_indoors.HEALTH_INIT = self.bolivian_indoors.HEALTH_INIT + addition
		self.drug_lord_boss.HEALTH_INIT = self.drug_lord_boss.HEALTH_INIT + addition
		self.drug_lord_boss_stealth.HEALTH_INIT = self.drug_lord_boss_stealth.HEALTH_INIT + addition

		return
	end

    local base = 1
	local divider = 0.090

	self.fbi.HEALTH_INIT = self.fbi.HEALTH_INIT * base + (wave / divider)
	self.swat.HEALTH_INIT = self.swat.HEALTH_INIT * base + (wave / divider)
	self.heavy_swat.HEALTH_INIT = self.heavy_swat.HEALTH_INIT * base + (wave / divider)
	self.fbi_heavy_swat.HEALTH_INIT = self.fbi_heavy_swat.HEALTH_INIT * base + (wave / divider)
	self.sniper.HEALTH_INIT = self.sniper.HEALTH_INIT * base + (wave / divider)
	self.gangster.HEALTH_INIT = self.gangster.HEALTH_INIT * base + (wave / divider)
	self.biker.HEALTH_INIT = self.biker.HEALTH_INIT * base + (wave / divider)
	self.tank.HEALTH_INIT = self.tank.HEALTH_INIT * base + (wave / divider)
	self.tank_mini.HEALTH_INIT = self.tank_mini.HEALTH_INIT * base + (wave / divider)
	self.tank_medic.HEALTH_INIT = self.tank_medic.HEALTH_INIT * base + (wave / divider)
	self.spooc.HEALTH_INIT = self.spooc.HEALTH_INIT * base + (wave / divider)
	self.shield.HEALTH_INIT = self.shield.HEALTH_INIT * base + (wave / divider)
	self.phalanx_minion.HEALTH_INIT = self.phalanx_minion.HEALTH_INIT * base + (wave / divider)
	self.phalanx_vip.HEALTH_INIT = self.phalanx_vip.HEALTH_INIT * base + (wave / divider)
	self.taser.HEALTH_INIT = self.taser.HEALTH_INIT * base + (wave / divider)
	self.city_swat.HEALTH_INIT = self.city_swat.HEALTH_INIT * base + (wave / divider)
	self.biker_escape.HEALTH_INIT = self.biker_escape.HEALTH_INIT * base + (wave / divider)
	self.fbi_swat.HEALTH_INIT = self.fbi_swat.HEALTH_INIT * base + (wave / divider)
	self.tank_hw.HEALTH_INIT = self.tank_hw.HEALTH_INIT * base + (wave / divider)
	self.medic.HEALTH_INIT = self.medic.HEALTH_INIT * base + (wave / divider)
	self.bolivian.HEALTH_INIT = self.bolivian.HEALTH_INIT * base + (wave / divider)
	self.bolivian_indoors.HEALTH_INIT = self.bolivian_indoors.HEALTH_INIT * base + (wave / divider)
	self.drug_lord_boss.HEALTH_INIT = self.drug_lord_boss.HEALTH_INIT * base + (wave / divider)
	self.drug_lord_boss_stealth.HEALTH_INIT = self.drug_lord_boss_stealth.HEALTH_INIT * base + (wave / divider)
end

Hooks:PostHook(CharacterTweakData, "_init_fbi", "zm_disable_surrenders", function(self, presets)
	self.fbi.surrender = nil
	self.fbi.rescue_hostages = false
	self.fbi.allowed_poses = {crouch = false, stand = true}
	self.fbi.dodge = nil
	self.fbi.no_retreat = true
	self.fbi.no_arrest = true
	--self.fbi.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_swat", "zm_disable_surrenders_2", function(self, presets)
	self.swat.surrender = nil
	self.swat.rescue_hostages = false
	self.swat.allowed_poses = {crouch = false, stand = true}
	self.swat.dodge = nil
	self.swat.no_retreat = true
	self.swat.no_arrest = true
	--self.swat.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_heavy_swat", "zm_disable_surrenders_3", function(self, presets)
	self.heavy_swat.surrender = nil
	self.heavy_swat.rescue_hostages = false
	self.heavy_swat.allowed_poses = {crouch = false, stand = true}
	self.heavy_swat.dodge = nil
	self.heavy_swat.no_retreat = true
	self.heavy_swat.no_arrest = true
	--self.heavy_swat.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_fbi_swat", "zm_disable_surrenders_4", function(self, presets)
	self.fbi_swat.surrender = nil
	self.fbi_swat.rescue_hostages = false
	self.fbi_swat.allowed_poses = {crouch = false, stand = true}
	self.fbi_swat.dodge = nil
	self.fbi_swat.no_retreat = true
	self.fbi_swat.no_arrest = true
	--self.fbi_swat.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_fbi_heavy_swat", "zm_disable_surrenders_5", function(self, presets)
	self.fbi_heavy_swat.surrender = nil
	self.fbi_heavy_swat.rescue_hostages = false
	self.fbi_heavy_swat.allowed_poses = {crouch = false, stand = true}
	self.fbi_heavy_swat.dodge = nil
	self.fbi_heavy_swat.no_retreat = true
	self.fbi_heavy_swat.no_arrest = true
	--self.fbi_heavy_swat.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_city_swat", "zm_disable_surrenders_6", function(self, presets)
	self.city_swat.surrender = nil
	self.city_swat.rescue_hostages = false
	self.city_swat.allowed_poses = {crouch = false, stand = true}
	self.city_swat.dodge = nil
	self.city_swat.no_retreat = true
	self.city_swat.no_arrest = true
	--self.city_swat.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_medic", "zm_med_tweak", function(self, presets)
	self.medic.rescue_hostages = false
	self.medic.suppression = nil
	self.medic.allowed_poses = {crouch = false, stand = true}
	self.medic.dodge = nil
	self.medic.no_retreat = true
	self.medic.no_arrest = true
	--self.medic.move_speed = presets.move_speed.lightning
end)

Hooks:PostHook(CharacterTweakData, "_init_taser", "zm_taser_tweak", function(self, presets)
	self.taser.dodge = nil
	self.taser.no_retreat = true
	self.taser.no_arrest = true
	self.taser.allowed_poses = {crouch = false, stand = true}
	--self.taser.move_speed = presets.move_speed.lightning

	self.taser.weapon.is_rifle.range.optimal = 10000
	self.taser.weapon.is_rifle.range.far = 10000
	self.taser.weapon.is_rifle.range.close = 10000
	self.taser.weapon.is_rifle.focus_delay = 1
end)

Hooks:PostHook(CharacterTweakData, "_init_spooc", "zm_cloakie_tweak", function(self, presets)
	self.spooc.allowed_poses = {crouch = false, stand = true}
end)

Hooks:PostHook(CharacterTweakData, "_init_tank", "zm_tankie_tweak", function(self, presets)
	self.tank.weapon.is_shotgun_mag.range.optimal = 10000
	self.tank.weapon.is_shotgun_mag.range.far = 10000
	self.tank.weapon.is_shotgun_mag.range.close = 10000
	self.tank.weapon.is_shotgun_mag.focus_delay = 1
	self.tank.weapon.is_rifle.range.optimal = 10000
	self.tank.weapon.is_rifle.range.far = 10000
	self.tank.weapon.is_rifle.range.close = 10000
	self.tank.weapon.is_rifle.focus_delay = 1
end)

function CharacterTweakData:_presets(tweak_data)
	local presets = {hurt_severities = {}}
	presets.hurt_severities.no_hurts = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		explosion = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		melee = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		fire = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		poison = {
			health_reference = 1,
			zones = {{none = 1}}
		}
	}
	presets.hurt_severities.no_hurts_no_tase = deep_clone(presets.hurt_severities.no_hurts)
	presets.hurt_severities.no_hurts_no_tase.tase = false
	presets.hurt_severities.only_light_hurt = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {{light = 1}}
		},
		explosion = {
			health_reference = 1,
			zones = {{explode = 1}}
		},
		melee = {
			health_reference = 1,
			zones = {{light = 1}}
		},
		fire = {
			health_reference = 1,
			zones = {{light = 1}}
		},
		poison = {
			health_reference = 1,
			zones = {{none = 1}}
		}
	}
	presets.hurt_severities.only_light_hurt_and_fire = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {{light = 1}}
		},
		explosion = {
			health_reference = 1,
			zones = {{explode = 1}}
		},
		melee = {
			health_reference = 1,
			zones = {{light = 1}}
		},
		fire = {
			health_reference = 1,
			zones = {{fire = 1}}
		},
		poison = {
			health_reference = 1,
			zones = {{none = 1}}
		}
	}
	presets.hurt_severities.light_hurt_fire_poison = deep_clone(presets.hurt_severities.only_light_hurt_and_fire)
	presets.hurt_severities.light_hurt_fire_poison.poison = {
		health_reference = 1,
		zones = {{poison = 1}}
	}
	presets.hurt_severities.only_explosion_hurts = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		explosion = {
			health_reference = 1,
			zones = {{explode = 1}}
		},
		melee = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		fire = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		poison = {
			health_reference = 1,
			zones = {{none = 1}}
		}
	}
	presets.hurt_severities.only_fire_and_poison_hurts = {
		tase = true,
		bullet = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		explosion = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		melee = {
			health_reference = 1,
			zones = {{none = 1}}
		},
		fire = {
			health_reference = 1,
			zones = {{fire = 1}}
		},
		poison = {
			health_reference = 1,
			zones = {{poison = 1}}
		}
	}
	presets.hurt_severities.base = {
		bullet = {
			health_reference = "current",
			zones = {
				{
					heavy = 0.05,
					health_limit = 0.3,
					light = 0.7,
					moderate = 0.05,
					none = 0.2
				},
				{
					heavy = 0.2,
					light = 0.4,
					moderate = 0.4,
					health_limit = 0.6
				},
				{
					heavy = 0.6,
					light = 0.2,
					moderate = 0.2,
					health_limit = 0.9
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		explosion = {
			health_reference = "current",
			zones = {
				{
					none = 0.6,
					heavy = 0.4,
					health_limit = 0.2
				},
				{
					explode = 0.4,
					heavy = 0.6,
					health_limit = 0.5
				},
				{
					explode = 0.8,
					heavy = 0.2
				}
			}
		},
		melee = {
			health_reference = "current",
			zones = {
				{
					heavy = 0,
					health_limit = 0.3,
					light = 0.7,
					moderate = 0,
					none = 0.3
				},
				{
					heavy = 0,
					light = 1,
					moderate = 0,
					health_limit = 0.8
				},
				{
					heavy = 0.2,
					light = 0.6,
					moderate = 0.2,
					health_limit = 0.9
				},
				{
					light = 0,
					moderate = 0,
					heavy = 9
				}
			}
		},
		fire = {
			health_reference = "current",
			zones = {{fire = 1}}
		},
		poison = {
			health_reference = "current",
			zones = {{
				poison = 1,
				none = 0
			}}
		}
	}
	presets.hurt_severities.base_no_poison = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.base_no_poison.poison = {
		health_reference = 1,
		zones = {{none = 1}}
	}
	presets.base = {
		HEALTH_INIT = 2.5,
		headshot_dmg_mul = 2,
		SPEED_WALK = {
			ntl = 120,
			cbt = 160,
			hos = 180,
			pnc = 160
		},
		SPEED_RUN = 370,
		crouch_move = true,
		shooting_death = true,
		suspicious = true,
		surrender_break_time = {
			20,
			30
		},
		submission_max = {
			45,
			60
		},
		submission_intimidate = 15,
		speech_prefix = "po",
		speech_prefix_count = 1,
		rescue_hostages = true,
		use_radio = self._default_chatter,
		dodge = nil,
		challenges = {type = "law"},
		calls_in = true,
		ignore_medic_revive_animation = false,
		spotlight_important = false,
		experience = {}
	}
	presets.base.experience.cable_tie = "tie_swat"
	presets.base.damage = {
		hurt_severity = presets.hurt_severities.base,
		death_severity = 0.5,
		explosion_damage_mul = 1,
		tased_response = {
			light = {
				down_time = 5,
				tased_time = 5
			},
			heavy = {
				down_time = 10,
				tased_time = 5
			}
		}
	}
	presets.gang_member_damage = {
		HEALTH_INIT = 75,
		REGENERATE_TIME = 2,
		REGENERATE_TIME_AWAY = 0.2,
		DOWNED_TIME = tweak_data.player.damage.DOWNED_TIME,
		TASED_TIME = tweak_data.player.damage.TASED_TIME,
		BLEED_OUT_HEALTH_INIT = tweak_data.player.damage.BLEED_OUT_HEALTH_INIT,
		ARRESTED_TIME = tweak_data.player.damage.ARRESTED_TIME,
		INCAPACITATED_TIME = tweak_data.player.damage.INCAPACITATED_TIME,
		hurt_severity = deep_clone(presets.hurt_severities.base)
	}
	presets.gang_member_damage.hurt_severity.bullet = {
		health_reference = "current",
		zones = {
			{
				none = 1,
				light = 0,
				moderate = 0,
				health_limit = 0.4
			},
			{
				none = 1,
				light = 0,
				moderate = 0,
				health_limit = 0.7
			},
			{
				heavy = 0,
				light = 0,
				moderate = 0,
				none = 1
			}
		}
	}
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.35
	presets.gang_member_damage.respawn_time_penalty = 0
	presets.gang_member_damage.base_respawn_time_penalty = 5
	presets.weapon = {normal = {}}
	presets.weapon.normal.is_pistol = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 25,
		miss_dis = 30,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.1,
					0.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 500,
				acc = {
					0.4,
					0.85
				},
				recoil = {
					0.1,
					0.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.375,
					0.55
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.25,
					0.45
				},
				recoil = {
					0.3,
					0.7
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					0.4,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.normal.akimbo_pistol = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 500,
				acc = {
					0.4,
					0.85
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.375,
					0.55
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.25,
					0.45
				},
				recoil = {
					0.3,
					0.7
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					0.4,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.normal.is_rifle = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			6,
			11
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.2,
					0.8
				},
				recoil = {
					0.35,
					0.75
				},
				mode = {
					1,
					2,
					2,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.4,
					1.2
				},
				mode = {
					3,
					2,
					2,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1.5,
					3
				},
				mode = {
					3,
					1,
					1,
					0
				}
			}
		}
	}
	presets.weapon.normal.is_bullpup = presets.weapon.normal.is_rifle
	presets.weapon.normal.is_shotgun_pump = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 20,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.5,
				r = 1000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.5,
				r = 2000,
				acc = {
					0.01,
					0.25
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.2,
				r = 3000,
				acc = {
					0.05,
					0.35
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.normal.is_shotgun_mag = presets.weapon.normal.is_shotgun_pump
	presets.weapon.normal.is_smg = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 20,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			6,
			11
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.1,
					0.3
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					0.1,
					0.3
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.2,
					0.8
				},
				recoil = {
					0.3,
					0.4
				},
				mode = {
					0,
					3,
					3,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.1,
					0.45
				},
				recoil = {
					0.3,
					0.4
				},
				mode = {
					0,
					3,
					3,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.1,
					0.35
				},
				recoil = {
					0.5,
					0.6
				},
				mode = {
					1,
					3,
					2,
					0
				}
			}
		}
	}
	presets.weapon.normal.is_revolver = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.8,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 500,
				acc = {
					0.5,
					0.85
				},
				recoil = {
					0.8,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.375,
					0.55
				},
				recoil = {
					0.8,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.75,
				r = 2000,
				acc = {
					0.25,
					0.45
				},
				recoil = {
					1,
					1.3
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.5,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.normal.mini = {
		aim_delay = {
			0.1,
			0.2
		},
		focus_delay = 1,
		focus_dis = 800,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.5,
		melee_speed = 1,
		melee_dmg = 25,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			20,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.7
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					8
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.4,
					0.6
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					3,
					6,
					6
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					2,
					2,
					1
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.1,
					0.35
				},
				recoil = {
					1,
					1.2
				},
				mode = {
					4,
					2,
					1,
					0
				}
			}
		}
	}
	presets.weapon.normal.is_lmg = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 24,
		miss_dis = 40,
		RELOAD_SPEED = 0.6,
		melee_speed = 1,
		melee_dmg = 2,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			20,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 2.5,
				r = 100,
				acc = {
					0.55,
					0.85
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.5,
					0.8
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 1000,
				acc = {
					0.2,
					0.7
				},
				recoil = {
					0.35,
					0.75
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.175,
					0.5
				},
				recoil = {
					0.4,
					1.2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1.5,
					3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
	}
	presets.weapon.good = {is_pistol = {}}
	presets.weapon.good.is_pistol.aim_delay = {
		0.1,
		0.1
	}
	presets.weapon.good.is_pistol.focus_delay = 1
	presets.weapon.good.is_pistol.focus_dis = 200
	presets.weapon.good.is_pistol.spread = 25
	presets.weapon.good.is_pistol.miss_dis = 30
	presets.weapon.good.is_pistol.RELOAD_SPEED = 1
	presets.weapon.good.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.good.is_pistol.melee_dmg = presets.weapon.normal.is_pistol.melee_dmg
	presets.weapon.good.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.good.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.good.is_pistol.FALLOFF = {
		{
			dmg_mul = 3,
			r = 100,
			acc = {
				0.6,
				0.9
			},
			recoil = {
				0.1,
				0.25
			},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			dmg_mul = 2,
			r = 500,
			acc = {
				0.5,
				0.9
			},
			recoil = {
				0.1,
				0.25
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 1,
			r = 1000,
			acc = {
				0.375,
				0.55
			},
			recoil = {
				0.15,
				0.3
			},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			dmg_mul = 1,
			r = 2000,
			acc = {
				0.15,
				0.45
			},
			recoil = {
				0.3,
				0.7
			},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			dmg_mul = 1,
			r = 3000,
			acc = {
				0.1,
				0.35
			},
			recoil = {
				0.4,
				1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.akimbo_pistol = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 1,
		melee_speed = presets.weapon.normal.is_pistol.melee_speed,
		melee_dmg = presets.weapon.normal.is_pistol.melee_dmg,
		melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay,
		range = presets.weapon.normal.is_pistol.range,
		FALLOFF = {
			{
				dmg_mul = 4,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.5,
					0.85
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.375,
					0.55
				},
				recoil = {
					0.15,
					0.4
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.25,
					0.45
				},
				recoil = {
					0.4,
					0.9
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					0.4,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.good.is_rifle = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 1,
		melee_speed = 1,
		melee_dmg = 15,
		melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.8
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.2,
					0.8
				},
				recoil = {
					0.35,
					0.75
				},
				mode = {
					1,
					2,
					2,
					0
				}
			},
			{
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.4,
					1.2
				},
				mode = {
					3,
					2,
					2,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1.5,
					3
				},
				mode = {
					3,
					1,
					1,
					0
				}
			}
		}
	}
	presets.weapon.good.is_bullpup = presets.weapon.good.is_rifle
	presets.weapon.good.is_shotgun_pump = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 20,
		RELOAD_SPEED = 1,
		melee_speed = 1,
		melee_dmg = 15,
		melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.95
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.01,
					0.25
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.4,
				r = 3000,
				acc = {
					0.05,
					0.35
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.good.is_shotgun_mag = presets.weapon.good.is_shotgun_pump
	presets.weapon.good.is_smg = {
		aim_delay = {
			0,
			0.2
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 10,
		RELOAD_SPEED = 1,
		melee_speed = presets.weapon.normal.is_smg.melee_speed,
		melee_dmg = 15,
		melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay,
		range = presets.weapon.normal.is_smg.range,
		autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.1,
					0.25
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.95
				},
				recoil = {
					0.1,
					0.3
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 1.75,
				r = 1000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					0.35,
					0.5
				},
				mode = {
					0,
					3,
					3,
					0
				}
			},
			{
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.1,
					0.45
				},
				recoil = {
					0.35,
					0.6
				},
				mode = {
					0,
					3,
					3,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.1,
					0.35
				},
				recoil = {
					0.5,
					0.6
				},
				mode = {
					1,
					3,
					2,
					0
				}
			}
		}
	}
	presets.weapon.good.is_revolver = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 8,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 4,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.8,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.5,
					0.85
				},
				recoil = {
					0.8,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.375,
					0.55
				},
				recoil = {
					0.8,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.25,
					0.45
				},
				recoil = {
					1,
					1.3
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.5,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.good.mini = {
		aim_delay = {
			0.1,
			0.2
		},
		focus_delay = 1,
		focus_dis = 800,
		spread = 30,
		miss_dis = 40,
		RELOAD_SPEED = 0.5,
		melee_speed = 1,
		melee_dmg = 25,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			20,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.1,
					0.15
				},
				recoil = {
					2,
					2
				},
				mode = {
					0,
					0,
					0,
					1
				},
				autofire_rounds = {
					150,
					200
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.05,
					0.1
				},
				recoil = {
					1.5,
					1.75
				},
				mode = {
					0,
					0,
					0,
					1
				},
				autofire_rounds = {
					120,
					160
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.04,
					0.075
				},
				recoil = {
					1.2,
					1.5
				},
				mode = {
					0,
					0,
					0,
					1
				},
				autofire_rounds = {
					100,
					140
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.025,
					0.05
				},
				recoil = {
					0.7,
					1
				},
				mode = {
					0,
					0,
					0,
					1
				},
				autofire_rounds = {
					60,
					100
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.01,
					0.025
				},
				recoil = {
					0.5,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				},
				autofire_rounds = {
					40,
					80
				}
			}
		}
	}
	presets.weapon.good.is_lmg = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 24,
		miss_dis = 40,
		RELOAD_SPEED = 0.66,
		melee_speed = 1,
		melee_dmg = 13,
		melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = presets.weapon.normal.is_lmg.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.8
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.2,
					0.8
				},
				recoil = {
					0.35,
					0.75
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.4,
					1.2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1.5,
					3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
	}
	presets.weapon.expert = {is_pistol = {}}
	presets.weapon.expert.is_pistol.aim_delay = {
		0.1,
		0.1
	}
	presets.weapon.expert.is_pistol.focus_delay = 1
	presets.weapon.expert.is_pistol.focus_dis = 300
	presets.weapon.expert.is_pistol.spread = 25
	presets.weapon.expert.is_pistol.miss_dis = 30
	presets.weapon.expert.is_pistol.RELOAD_SPEED = 1.1
	presets.weapon.expert.is_pistol.melee_speed = presets.weapon.normal.is_pistol.melee_speed
	presets.weapon.expert.is_pistol.melee_dmg = presets.weapon.normal.is_pistol.melee_dmg
	presets.weapon.expert.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.expert.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.expert.is_pistol.FALLOFF = {
		{
			dmg_mul = 4,
			r = 0,
			acc = {
				0.5,
				0.95
			},
			recoil = {
				0.1,
				0.25
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 2,
			r = 1000,
			acc = {
				0.375,
				0.55
			},
			recoil = {
				0.15,
				0.3
			},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			dmg_mul = 2,
			r = 2000,
			acc = {
				0.05,
				0.5
			},
			recoil = {
				0.3,
				0.7
			},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			dmg_mul = 2,
			r = 3000,
			acc = {
				0,
				0.3
			},
			recoil = {
				0.4,
				1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.is_pistol = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 300,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 1.2,
		melee_speed = presets.weapon.normal.is_pistol.melee_speed,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay,
		range = presets.weapon.normal.is_pistol.range,
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.9
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					1,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.4,
					0.65
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					1,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.3,
					0.5
				},
				recoil = {
					0.4,
					0.9
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2.5,
				r = 3000,
				acc = {
					0.1,
					0.25
				},
				recoil = {
					0.4,
					1.4
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.expert.akimbo_pistol = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 300,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 1.2,
		melee_speed = presets.weapon.normal.is_pistol.melee_speed,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay,
		range = presets.weapon.normal.is_pistol.range,
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.9
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					1,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.4,
					0.65
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					1,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.3,
					0.5
				},
				recoil = {
					0.4,
					0.9
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2.5,
				r = 3000,
				acc = {
					0.1,
					0.25
				},
				recoil = {
					0.4,
					1.4
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.expert.is_shotgun_pump = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 20,
		RELOAD_SPEED = 1,
		melee_speed = 1,
		melee_dmg = 15,
		melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.95
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.01,
					0.25
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 0.4,
				r = 3000,
				acc = {
					0.05,
					0.35
				},
				recoil = {
					1.5,
					2
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.expert.is_shotgun_mag = presets.weapon.expert.is_shotgun_pump
	presets.weapon.expert.is_rifle = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 1,
		melee_speed = 1,
		melee_dmg = 15,
		melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.8
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.2,
					0.8
				},
				recoil = {
					0.35,
					0.75
				},
				mode = {
					1,
					2,
					2,
					0
				}
			},
			{
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.4,
					1.2
				},
				mode = {
					3,
					2,
					2,
					0
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1.5,
					3
				},
				mode = {
					3,
					1,
					1,
					0
				}
			}
		}
	}
	presets.weapon.expert.is_bullpup = presets.weapon.expert.is_rifle
	presets.weapon.expert.is_smg = {
		aim_delay = {
			0,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 10,
		RELOAD_SPEED = 1.2,
		melee_speed = presets.weapon.normal.is_smg.melee_speed,
		melee_dmg = presets.weapon.normal.is_smg.melee_dmg,
		melee_retry_delay = presets.weapon.normal.is_smg.melee_retry_delay,
		range = presets.weapon.normal.is_smg.range,
		autofire_rounds = presets.weapon.normal.is_smg.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.95
				},
				recoil = {
					0.1,
					0.25
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 4.5,
				r = 500,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.1,
					0.3
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 1000,
				acc = {
					0.4,
					0.65
				},
				recoil = {
					0.35,
					0.5
				},
				mode = {
					0,
					3,
					3,
					0
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.4,
					0.6
				},
				recoil = {
					0.35,
					0.7
				},
				mode = {
					0,
					3,
					3,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 3000,
				acc = {
					0.2,
					0.35
				},
				recoil = {
					0.5,
					1.5
				},
				mode = {
					1,
					3,
					2,
					0
				}
			}
		}
	}
	presets.weapon.expert.is_revolver = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 0.9,
		melee_speed = 1,
		melee_dmg = 8,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.8,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.85
				},
				recoil = {
					0.8,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2.5,
				r = 1000,
				acc = {
					0.375,
					0.55
				},
				recoil = {
					0.8,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 2000,
				acc = {
					0.25,
					0.45
				},
				recoil = {
					1,
					1.3
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 1.5,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.expert.mini = {
		aim_delay = {
			0.1,
			0.2
		},
		focus_delay = 1,
		focus_dis = 800,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.5,
		melee_speed = 1,
		melee_dmg = 25,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			20,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.7
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					8
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.4,
					0.6
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					3,
					6,
					6
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					2,
					2,
					1
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.1,
					0.35
				},
				recoil = {
					1,
					1.2
				},
				mode = {
					4,
					2,
					1,
					0
				}
			}
		}
	}
	presets.weapon.expert.is_lmg = {
		aim_delay = {
			0.1,
			0.1
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 24,
		miss_dis = 40,
		RELOAD_SPEED = 1,
		melee_speed = 1,
		melee_dmg = 15,
		melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = presets.weapon.normal.is_lmg.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.65,
					0.85
				},
				recoil = {
					0.4,
					0.8
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 500,
				acc = {
					0.4,
					0.8
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1.5,
				r = 1000,
				acc = {
					0.2,
					0.7
				},
				recoil = {
					0.35,
					0.75
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1.25,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.4,
					1.2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1.5,
					3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
	}
	presets.weapon.sniper = {is_rifle = {}}
	presets.weapon.sniper.is_rifle.aim_delay = {
		0,
		0.1
	}
	presets.weapon.sniper.is_rifle.focus_delay = 1
	presets.weapon.sniper.is_rifle.focus_dis = 200
	presets.weapon.sniper.is_rifle.spread = 30
	presets.weapon.sniper.is_rifle.miss_dis = 250
	presets.weapon.sniper.is_rifle.RELOAD_SPEED = 1.25
	presets.weapon.sniper.is_rifle.melee_speed = presets.weapon.normal.is_rifle.melee_speed
	presets.weapon.sniper.is_rifle.melee_dmg = presets.weapon.normal.is_rifle.melee_dmg
	presets.weapon.sniper.is_rifle.melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay
	presets.weapon.sniper.is_rifle.range = {
		optimal = 15000,
		far = 15000,
		close = 15000
	}
	presets.weapon.sniper.is_rifle.autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds
	presets.weapon.sniper.is_rifle.use_laser = true
	presets.weapon.sniper.is_rifle.FALLOFF = {
		{
			dmg_mul = 5,
			r = 700,
			acc = {
				0.4,
				0.95
			},
			recoil = {
				2,
				4
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 5,
			r = 3500,
			acc = {
				0.1,
				0.75
			},
			recoil = {
				3,
				4
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 2.5,
			r = 10000,
			acc = {
				0,
				0.25
			},
			recoil = {
				3,
				5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish = {is_revolver = {}}
	presets.weapon.deathwish.is_revolver.aim_delay = {
		0,
		0
	}
	presets.weapon.deathwish.is_revolver.focus_delay = 1
	presets.weapon.deathwish.is_revolver.focus_dis = 200
	presets.weapon.deathwish.is_revolver.spread = 20
	presets.weapon.deathwish.is_revolver.miss_dis = 50
	presets.weapon.deathwish.is_revolver.RELOAD_SPEED = 0.9
	presets.weapon.deathwish.is_revolver.melee_speed = 1
	presets.weapon.deathwish.is_revolver.melee_dmg = 8
	presets.weapon.deathwish.is_revolver.melee_retry_delay = {
		1,
		2
	}
	presets.weapon.deathwish.is_revolver.range = {
		optimal = 10000,
		far = 10000,
		close = 10000
	}
	presets.weapon.deathwish.is_revolver.FALLOFF = {
		{
			dmg_mul = 5,
			r = 100,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.8,
				1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 4,
			r = 500,
			acc = {
				0.6,
				0.85
			},
			recoil = {
				0.8,
				1.1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 3.5,
			r = 1000,
			acc = {
				0.5,
				0.75
			},
			recoil = {
				0.8,
				1.1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 3,
			r = 2000,
			acc = {
				0.5,
				0.65
			},
			recoil = {
				1,
				1.3
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 2.5,
			r = 3000,
			acc = {
				0.1,
				0.35
			},
			recoil = {
				1,
				1.5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.is_pistol = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 1.4,
		melee_speed = presets.weapon.expert.is_pistol.melee_speed,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_pistol.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 6.5,
				r = 100,
				acc = {
					0.9,
					0.95
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 6.5,
				r = 500,
				acc = {
					0.9,
					0.95
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					0,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 6.5,
				r = 1000,
				acc = {
					0.7,
					0.8
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					1,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 6.5,
				r = 2000,
				acc = {
					0.6,
					0.7
				},
				recoil = {
					0.4,
					0.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 6,
				r = 3000,
				acc = {
					0.6,
					0.65
				},
				recoil = {
					0.6,
					0.8
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 6,
				r = 4000,
				acc = {
					0.2,
					0.65
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.deathwish.is_rifle = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 1.4,
		melee_speed = 1,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_rifle.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			4,
			9
		},
		FALLOFF = {
			{
				dmg_mul = 7.5,
				r = 100,
				acc = {
					0.9,
					0.975
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 7.5,
				r = 500,
				acc = {
					0.875,
					0.95
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					3,
					8,
					1
				}
			},
			{
				dmg_mul = 7.5,
				r = 1000,
				acc = {
					0.7,
					0.9
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					0,
					2,
					5,
					1
				}
			},
			{
				dmg_mul = 7.5,
				r = 2000,
				acc = {
					0.7,
					0.85
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					3,
					2,
					5,
					1
				}
			},
			{
				dmg_mul = 7.5,
				r = 3000,
				acc = {
					0.65,
					0.75
				},
				recoil = {
					0.7,
					1.1
				},
				mode = {
					3,
					1,
					5,
					0.5
				}
			},
			{
				dmg_mul = 7.5,
				r = 6000,
				acc = {
					0.25,
					0.7
				},
				recoil = {
					1,
					2
				},
				mode = {
					3,
					1,
					1,
					0
				}
			}
		}
	}
	presets.weapon.deathwish.is_bullpup = presets.weapon.deathwish.is_rifle
	presets.weapon.deathwish.is_shotgun_pump = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 20,
		RELOAD_SPEED = 1.4,
		melee_speed = 1,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_shotgun_pump.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 8,
				r = 100,
				acc = {
					0.95,
					0.95
				},
				recoil = {
					1,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 7.5,
				r = 500,
				acc = {
					0.7,
					0.95
				},
				recoil = {
					1,
					1.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 7,
				r = 1000,
				acc = {
					0.5,
					0.8
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 5,
				r = 2000,
				acc = {
					0.45,
					0.65
				},
				recoil = {
					1.25,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.3,
					0.5
				},
				recoil = {
					1.5,
					1.75
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.deathwish.is_shotgun_mag = presets.weapon.deathwish.is_shotgun_pump
	presets.weapon.deathwish.is_smg = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 10,
		RELOAD_SPEED = 1.4,
		melee_speed = presets.weapon.expert.is_smg.melee_speed,
		melee_dmg = presets.weapon.expert.is_smg.melee_dmg,
		melee_retry_delay = presets.weapon.expert.is_smg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			8,
			16
		},
		FALLOFF = {
			{
				dmg_mul = 6.75,
				r = 100,
				acc = {
					0.95,
					0.95
				},
				recoil = {
					0.1,
					0.25
				},
				mode = {
					0,
					3,
					3,
					4
				}
			},
			{
				dmg_mul = 6.75,
				r = 500,
				acc = {
					0.75,
					0.75
				},
				recoil = {
					0.1,
					0.3
				},
				mode = {
					0,
					3,
					3,
					4
				}
			},
			{
				dmg_mul = 6.75,
				r = 1000,
				acc = {
					0.65,
					0.65
				},
				recoil = {
					0.35,
					0.5
				},
				mode = {
					0,
					6,
					3,
					3
				}
			},
			{
				dmg_mul = 6.75,
				r = 2000,
				acc = {
					0.6,
					0.7
				},
				recoil = {
					0.35,
					0.5
				},
				mode = {
					0,
					6,
					3,
					0
				}
			},
			{
				dmg_mul = 6.75,
				r = 3000,
				acc = {
					0.55,
					0.6
				},
				recoil = {
					0.5,
					1.5
				},
				mode = {
					1,
					6,
					2,
					0
				}
			},
			{
				dmg_mul = 6.75,
				r = 4500,
				acc = {
					0.3,
					0.6
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					3,
					2,
					0
				}
			}
		}
	}
	presets.weapon.deathwish.mini = {
		aim_delay = {
			0.1,
			0.2
		},
		focus_delay = 1,
		focus_dis = 800,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.5,
		melee_speed = 1,
		melee_dmg = 25,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			20,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.7
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					8
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.4,
					0.6
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					3,
					6,
					6
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					2,
					2,
					1
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.1,
					0.35
				},
				recoil = {
					1,
					1.2
				},
				mode = {
					4,
					2,
					1,
					0
				}
			}
		}
	}
	presets.weapon.deathwish.is_lmg = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 24,
		miss_dis = 40,
		RELOAD_SPEED = 0.75,
		melee_speed = 1,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_lmg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			25,
			50
		},
		FALLOFF = {
			{
				dmg_mul = 4,
				r = 100,
				acc = {
					0.8,
					0.9
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.75,
					0.9
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 3,
				r = 1000,
				acc = {
					0.5,
					0.8
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 2000,
				acc = {
					0.4,
					0.65
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.2,
					0.35
				},
				recoil = {
					0.7,
					1.1
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.35,
				r = 6000,
				acc = {
					0.1,
					0.2
				},
				recoil = {
					1,
					2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
	}
	presets.weapon.easywish = {is_revolver = {}}
	presets.weapon.easywish.is_revolver.aim_delay = {
		0,
		0
	}
	presets.weapon.easywish.is_revolver.focus_delay = 1
	presets.weapon.easywish.is_revolver.focus_dis = 200
	presets.weapon.easywish.is_revolver.spread = 20
	presets.weapon.easywish.is_revolver.miss_dis = 50
	presets.weapon.easywish.is_revolver.RELOAD_SPEED = 0.9
	presets.weapon.easywish.is_revolver.melee_speed = 1
	presets.weapon.easywish.is_revolver.melee_dmg = 8
	presets.weapon.easywish.is_revolver.melee_retry_delay = {
		1,
		2
	}
	presets.weapon.easywish.is_revolver.range = {
		optimal = 10000,
		far = 10000,
		close = 10000
	}
	presets.weapon.easywish.is_revolver.FALLOFF = {
		{
			dmg_mul = 5,
			r = 100,
			acc = {
				0.7,
				0.9
			},
			recoil = {
				0.8,
				1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 4,
			r = 500,
			acc = {
				0.6,
				0.85
			},
			recoil = {
				0.8,
				1.1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 3,
			r = 1000,
			acc = {
				0.5,
				0.75
			},
			recoil = {
				0.8,
				1.1
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 3,
			r = 2000,
			acc = {
				0.5,
				0.65
			},
			recoil = {
				1,
				1.3
			},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			dmg_mul = 2.5,
			r = 3000,
			acc = {
				0.1,
				0.35
			},
			recoil = {
				1,
				1.5
			},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.easywish.is_pistol = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 50,
		RELOAD_SPEED = 1.4,
		melee_speed = presets.weapon.expert.is_pistol.melee_speed,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_pistol.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.9,
					0.95
				},
				recoil = {
					0.15,
					0.25
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 5,
				r = 500,
				acc = {
					0.9,
					0.95
				},
				recoil = {
					0.15,
					0.3
				},
				mode = {
					0,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 1000,
				acc = {
					0.7,
					0.8
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					1,
					0,
					1,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 2000,
				acc = {
					0.6,
					0.7
				},
				recoil = {
					0.4,
					0.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 3000,
				acc = {
					0.6,
					0.65
				},
				recoil = {
					0.6,
					0.8
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 3,
				r = 4000,
				acc = {
					0.2,
					0.65
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 2,
				r = 5000,
				acc = {
					0.1,
					0.5
				},
				recoil = {
					0.4,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.easywish.is_rifle = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 1.4,
		melee_speed = 1,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_rifle.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			4,
			9
		},
		FALLOFF = {
			{
				dmg_mul = 5.25,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					3,
					3,
					1
				}
			},
			{
				dmg_mul = 4.75,
				r = 500,
				acc = {
					0.4,
					0.9
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					3,
					8,
					1
				}
			},
			{
				dmg_mul = 4.5,
				r = 1000,
				acc = {
					0.2,
					0.8
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					0,
					2,
					5,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					3,
					2,
					5,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 3000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					0.7,
					1.1
				},
				mode = {
					3,
					1,
					5,
					0.5
				}
			},
			{
				dmg_mul = 3,
				r = 6000,
				acc = {
					0.01,
					0.35
				},
				recoil = {
					1,
					2
				},
				mode = {
					3,
					1,
					1,
					0
				}
			}
		}
	}
	presets.weapon.easywish.is_bullpup = presets.weapon.easywish.is_rifle
	presets.weapon.easywish.is_shotgun_pump = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 20,
		RELOAD_SPEED = 1.4,
		melee_speed = 1,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_shotgun_pump.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 5.5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					1,
					1.1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4.75,
				r = 500,
				acc = {
					0.4,
					0.95
				},
				recoil = {
					1,
					1.25
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 1000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 2000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					1.25,
					1.5
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.2,
					0.75
				},
				recoil = {
					1.5,
					1.75
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.easywish.is_shotgun_mag = presets.weapon.easywish.is_shotgun_pump
	presets.weapon.easywish.is_smg = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 15,
		miss_dis = 10,
		RELOAD_SPEED = 1.4,
		melee_speed = presets.weapon.expert.is_smg.melee_speed,
		melee_dmg = presets.weapon.expert.is_smg.melee_dmg,
		melee_retry_delay = presets.weapon.expert.is_smg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			8,
			16
		},
		FALLOFF = {
			{
				dmg_mul = 6,
				r = 100,
				acc = {
					0.95,
					0.95
				},
				recoil = {
					0.1,
					0.25
				},
				mode = {
					0,
					3,
					3,
					4
				}
			},
			{
				dmg_mul = 5,
				r = 500,
				acc = {
					0.6,
					0.75
				},
				recoil = {
					0.1,
					0.3
				},
				mode = {
					0,
					3,
					3,
					4
				}
			},
			{
				dmg_mul = 5,
				r = 1000,
				acc = {
					0.5,
					0.65
				},
				recoil = {
					0.35,
					0.5
				},
				mode = {
					0,
					6,
					3,
					3
				}
			},
			{
				dmg_mul = 4,
				r = 2000,
				acc = {
					0.5,
					0.6
				},
				recoil = {
					0.35,
					0.5
				},
				mode = {
					0,
					6,
					3,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 3000,
				acc = {
					0.5,
					0.6
				},
				recoil = {
					0.5,
					1.5
				},
				mode = {
					1,
					6,
					2,
					0
				}
			},
			{
				dmg_mul = 4,
				r = 4500,
				acc = {
					0.3,
					0.6
				},
				recoil = {
					1,
					1.5
				},
				mode = {
					1,
					3,
					2,
					0
				}
			}
		}
	}
	presets.weapon.easywish.mini = {
		aim_delay = {
			0.1,
			0.2
		},
		focus_delay = 1,
		focus_dis = 800,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.5,
		melee_speed = 1,
		melee_dmg = 25,
		melee_retry_delay = {
			1,
			2
		},
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			20,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					0.6,
					0.9
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 4,
				r = 500,
				acc = {
					0.5,
					0.7
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					1,
					2,
					8
				}
			},
			{
				dmg_mul = 3.5,
				r = 1000,
				acc = {
					0.4,
					0.6
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					3,
					6,
					6
				}
			},
			{
				dmg_mul = 3,
				r = 2000,
				acc = {
					0.2,
					0.5
				},
				recoil = {
					0.45,
					0.8
				},
				mode = {
					1,
					2,
					2,
					1
				}
			},
			{
				dmg_mul = 3,
				r = 3000,
				acc = {
					0.1,
					0.35
				},
				recoil = {
					1,
					1.2
				},
				mode = {
					4,
					2,
					1,
					0
				}
			}
		}
	}
	presets.weapon.easywish.is_lmg = {
		aim_delay = {
			0,
			0
		},
		focus_delay = 1,
		focus_dis = 200,
		spread = 20,
		miss_dis = 40,
		RELOAD_SPEED = 0.7,
		melee_speed = 1,
		melee_dmg = 20,
		melee_retry_delay = presets.weapon.expert.is_lmg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 10000
		},
		autofire_rounds = {
			25,
			40
		},
		FALLOFF = {
			{
				dmg_mul = 3,
				r = 100,
				acc = {
					0.7,
					0.8
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2.5,
				r = 500,
				acc = {
					0.65,
					0.8
				},
				recoil = {
					0.25,
					0.3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 1000,
				acc = {
					0.55,
					0.75
				},
				recoil = {
					0.35,
					0.55
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 2000,
				acc = {
					0.4,
					0.6
				},
				recoil = {
					0.4,
					0.7
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.2,
					0.35
				},
				recoil = {
					0.7,
					1.1
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.25,
				r = 6000,
				acc = {
					0.01,
					0.2
				},
				recoil = {
					1,
					2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
	}
	presets.weapon.gang_member = {is_pistol = {}}
	presets.weapon.gang_member.is_pistol.aim_delay = {
		0,
		0.5
	}
	presets.weapon.gang_member.is_pistol.focus_delay = 1
	presets.weapon.gang_member.is_pistol.focus_dis = 2000
	presets.weapon.gang_member.is_pistol.spread = 25
	presets.weapon.gang_member.is_pistol.miss_dis = 20
	presets.weapon.gang_member.is_pistol.RELOAD_SPEED = 1.5
	presets.weapon.gang_member.is_pistol.melee_speed = 3
	presets.weapon.gang_member.is_pistol.melee_dmg = 3
	presets.weapon.gang_member.is_pistol.melee_retry_delay = presets.weapon.normal.is_pistol.melee_retry_delay
	presets.weapon.gang_member.is_pistol.range = presets.weapon.normal.is_pistol.range
	presets.weapon.gang_member.is_pistol.FALLOFF = {
		{
			dmg_mul = 5,
			r = 300,
			acc = {
				1,
				1
			},
			recoil = {
				0.25,
				0.45
			},
			mode = {
				0.1,
				0.3,
				4,
				7
			}
		},
		{
			dmg_mul = 2.5,
			r = 10000,
			acc = {
				1,
				1
			},
			recoil = {
				2,
				3
			},
			mode = {
				0.1,
				0.3,
				4,
				7
			}
		}
	}
	presets.weapon.gang_member.is_rifle = {
		aim_delay = {
			0,
			0.5
		},
		focus_delay = 1,
		focus_dis = 3000,
		spread = 25,
		miss_dis = 10,
		RELOAD_SPEED = 1,
		melee_speed = 2,
		melee_dmg = 3,
		melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 1500
		},
		autofire_rounds = presets.weapon.normal.is_rifle.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 300,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			},
			{
				dmg_mul = 2.5,
				r = 10000,
				acc = {
					1,
					1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			}
		}
	}
	presets.weapon.gang_member.is_sniper = {
		aim_delay = {
			0.25,
			1
		},
		focus_delay = 1,
		focus_dis = 3000,
		spread = 25,
		miss_dis = 10,
		RELOAD_SPEED = 1,
		melee_speed = 2,
		melee_dmg = 3,
		melee_retry_delay = presets.weapon.normal.is_rifle.melee_retry_delay,
		range = {
			optimal = 4000,
			far = 10000,
			close = 10000
		},
		FALLOFF = {
			{
				dmg_mul = 10,
				r = 500,
				acc = {
					1,
					1
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 10,
				r = 1000,
				acc = {
					1,
					1
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 10,
				r = 2500,
				acc = {
					0.95,
					1
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 5,
				r = 4000,
				acc = {
					0.9,
					0.95
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			},
			{
				dmg_mul = 5,
				r = 10000,
				acc = {
					0.85,
					0.9
				},
				recoil = {
					1,
					1
				},
				mode = {
					1,
					0,
					0,
					0
				}
			}
		}
	}
	presets.weapon.gang_member.is_lmg = {
		aim_delay = {
			0,
			0.5
		},
		focus_delay = 1,
		focus_dis = 3000,
		spread = 30,
		miss_dis = 10,
		RELOAD_SPEED = 0.7,
		melee_speed = 2,
		melee_dmg = 3,
		melee_retry_delay = presets.weapon.normal.is_lmg.melee_retry_delay,
		range = {
			optimal = 10000,
			far = 10000,
			close = 1500
		},
		autofire_rounds = presets.weapon.normal.is_lmg.autofire_rounds,
		FALLOFF = {
			{
				dmg_mul = 4,
				r = 100,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 3,
				r = 1000,
				acc = {
					0.85,
					0.9
				},
				recoil = {
					0.4,
					0.65
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 2,
				r = 2000,
				acc = {
					0.6,
					0.8
				},
				recoil = {
					0.8,
					1.25
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 1,
				r = 3000,
				acc = {
					0.5,
					0.7
				},
				recoil = {
					0.8,
					1.25
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.4,
				r = 4000,
				acc = {
					0.02,
					0.25
				},
				recoil = {
					1,
					2
				},
				mode = {
					0,
					0,
					0,
					1
				}
			},
			{
				dmg_mul = 0.25,
				r = 10000,
				acc = {
					0.01,
					0.1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0,
					0,
					0,
					1
				}
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_pump = {
		aim_delay = {
			0,
			0.25
		},
		focus_delay = 1,
		focus_dis = 2000,
		spread = 15,
		miss_dis = 10,
		RELOAD_SPEED = 2,
		melee_speed = 2,
		melee_dmg = 3,
		melee_retry_delay = presets.weapon.normal.is_shotgun_pump.melee_retry_delay,
		range = presets.weapon.normal.is_shotgun_pump.range,
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 300,
				acc = {
					1,
					1
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			},
			{
				dmg_mul = 2.5,
				r = 10000,
				acc = {
					1,
					1
				},
				recoil = {
					2,
					3
				},
				mode = {
					0.1,
					0.3,
					4,
					7
				}
			}
		}
	}
	presets.weapon.gang_member.is_shotgun_mag = {
		aim_delay = {
			0,
			0.25
		},
		focus_delay = 1,
		focus_dis = 2000,
		spread = 18,
		miss_dis = 10,
		RELOAD_SPEED = 1.6,
		melee_speed = 2,
		melee_dmg = 3,
		melee_retry_delay = presets.weapon.normal.is_shotgun_mag.melee_retry_delay,
		range = presets.weapon.normal.is_shotgun_mag.range,
		autofire_rounds = {
			4,
			8
		},
		FALLOFF = {
			{
				dmg_mul = 5,
				r = 100,
				acc = {
					1,
					1
				},
				recoil = {
					0.1,
					0.1
				},
				mode = {
					1,
					1,
					4,
					6
				}
			},
			{
				dmg_mul = 5,
				r = 500,
				acc = {
					1,
					1
				},
				recoil = {
					0.1,
					0.1
				},
				mode = {
					1,
					1,
					4,
					5
				}
			},
			{
				dmg_mul = 4,
				r = 1000,
				acc = {
					0.85,
					0.95
				},
				recoil = {
					0.1,
					0.15
				},
				mode = {
					1,
					2,
					4,
					4
				}
			},
			{
				dmg_mul = 1.5,
				r = 2000,
				acc = {
					0.75,
					0.9
				},
				recoil = {
					0.25,
					0.45
				},
				mode = {
					1,
					4,
					4,
					1
				}
			},
			{
				dmg_mul = 0.5,
				r = 3000,
				acc = {
					0.4,
					0.7
				},
				recoil = {
					0.4,
					0.5
				},
				mode = {
					4,
					2,
					1,
					0
				}
			},
			{
				dmg_mul = 0.1,
				r = 10000,
				acc = {
					0.05,
					0.2
				},
				recoil = {
					0.5,
					1
				},
				mode = {
					2,
					1,
					0,
					0
				}
			}
		}
	}
	presets.weapon.gang_member.is_smg = presets.weapon.gang_member.is_rifle
	presets.weapon.gang_member.is_pistol = presets.weapon.gang_member.is_pistol
	presets.weapon.gang_member.is_revolver = presets.weapon.gang_member.is_pistol
	presets.weapon.gang_member.is_bullpup = presets.weapon.gang_member.is_rifle
	presets.weapon.gang_member.mac11 = presets.weapon.gang_member.is_smg
	presets.weapon.gang_member.rifle = deep_clone(presets.weapon.gang_member.is_rifle)
	presets.weapon.gang_member.rifle.autofire_rounds = nil
	presets.weapon.gang_member.akimbo_pistol = presets.weapon.gang_member.is_pistol
	presets.detection = {normal = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}}
	presets.detection.normal.idle.dis_max = 10000
	presets.detection.normal.idle.angle_max = 120
	presets.detection.normal.idle.delay = {
		0,
		0
	}
	presets.detection.normal.idle.use_uncover_range = true
	presets.detection.normal.combat.dis_max = 10000
	presets.detection.normal.combat.angle_max = 120
	presets.detection.normal.combat.delay = {
		0,
		0
	}
	presets.detection.normal.combat.use_uncover_range = true
	presets.detection.normal.recon.dis_max = 10000
	presets.detection.normal.recon.angle_max = 120
	presets.detection.normal.recon.delay = {
		0,
		0
	}
	presets.detection.normal.recon.use_uncover_range = true
	presets.detection.normal.guard.dis_max = 10000
	presets.detection.normal.guard.angle_max = 120
	presets.detection.normal.guard.delay = {
		0,
		0
	}
	presets.detection.normal.ntl.dis_max = 4000
	presets.detection.normal.ntl.angle_max = 60
	presets.detection.normal.ntl.delay = {
		0.2,
		2
	}
	presets.detection.guard = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.guard.idle.dis_max = 10000
	presets.detection.guard.idle.angle_max = 120
	presets.detection.guard.idle.delay = {
		0,
		0
	}
	presets.detection.guard.idle.use_uncover_range = true
	presets.detection.guard.combat.dis_max = 10000
	presets.detection.guard.combat.angle_max = 120
	presets.detection.guard.combat.delay = {
		0,
		0
	}
	presets.detection.guard.combat.use_uncover_range = true
	presets.detection.guard.recon.dis_max = 10000
	presets.detection.guard.recon.angle_max = 120
	presets.detection.guard.recon.delay = {
		0,
		0
	}
	presets.detection.guard.recon.use_uncover_range = true
	presets.detection.guard.guard.dis_max = 10000
	presets.detection.guard.guard.angle_max = 120
	presets.detection.guard.guard.delay = {
		0,
		0
	}
	presets.detection.guard.ntl = presets.detection.normal.ntl
	presets.detection.sniper = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.sniper.idle.dis_max = 10000
	presets.detection.sniper.idle.angle_max = 180
	presets.detection.sniper.idle.delay = {
		0.5,
		1
	}
	presets.detection.sniper.idle.use_uncover_range = true
	presets.detection.sniper.combat.dis_max = 10000
	presets.detection.sniper.combat.angle_max = 120
	presets.detection.sniper.combat.delay = {
		0.5,
		1
	}
	presets.detection.sniper.combat.use_uncover_range = true
	presets.detection.sniper.recon.dis_max = 10000
	presets.detection.sniper.recon.angle_max = 120
	presets.detection.sniper.recon.delay = {
		0.5,
		1
	}
	presets.detection.sniper.recon.use_uncover_range = true
	presets.detection.sniper.guard.dis_max = 10000
	presets.detection.sniper.guard.angle_max = 150
	presets.detection.sniper.guard.delay = {
		0.3,
		1
	}
	presets.detection.sniper.ntl = presets.detection.normal.ntl
	presets.detection.gang_member = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.gang_member.idle.dis_max = 10000
	presets.detection.gang_member.idle.angle_max = 120
	presets.detection.gang_member.idle.delay = {
		0,
		0
	}
	presets.detection.gang_member.idle.use_uncover_range = true
	presets.detection.gang_member.combat.dis_max = 10000
	presets.detection.gang_member.combat.angle_max = 120
	presets.detection.gang_member.combat.delay = {
		0,
		0
	}
	presets.detection.gang_member.combat.use_uncover_range = true
	presets.detection.gang_member.recon.dis_max = 10000
	presets.detection.gang_member.recon.angle_max = 120
	presets.detection.gang_member.recon.delay = {
		0,
		0
	}
	presets.detection.gang_member.recon.use_uncover_range = true
	presets.detection.gang_member.guard.dis_max = 10000
	presets.detection.gang_member.guard.angle_max = 120
	presets.detection.gang_member.guard.delay = {
		0,
		0
	}
	presets.detection.gang_member.ntl = presets.detection.normal.ntl
	presets.detection.civilian = {
		cbt = {},
		ntl = {}
	}
	presets.detection.civilian.cbt.dis_max = 700
	presets.detection.civilian.cbt.angle_max = 120
	presets.detection.civilian.cbt.delay = {
		0,
		0
	}
	presets.detection.civilian.cbt.use_uncover_range = true
	presets.detection.civilian.ntl.dis_max = 2000
	presets.detection.civilian.ntl.angle_max = 60
	presets.detection.civilian.ntl.delay = {
		0.2,
		3
	}
	presets.detection.blind = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.blind.idle.dis_max = 1
	presets.detection.blind.idle.angle_max = 0
	presets.detection.blind.idle.delay = {
		0,
		0
	}
	presets.detection.blind.idle.use_uncover_range = false
	presets.detection.blind.combat.dis_max = 1
	presets.detection.blind.combat.angle_max = 0
	presets.detection.blind.combat.delay = {
		0,
		0
	}
	presets.detection.blind.combat.use_uncover_range = false
	presets.detection.blind.recon.dis_max = 1
	presets.detection.blind.recon.angle_max = 0
	presets.detection.blind.recon.delay = {
		0,
		0
	}
	presets.detection.blind.recon.use_uncover_range = false
	presets.detection.blind.guard.dis_max = 1
	presets.detection.blind.guard.angle_max = 0
	presets.detection.blind.guard.delay = {
		0,
		0
	}
	presets.detection.blind.guard.use_uncover_range = false
	presets.detection.blind.ntl.dis_max = 1
	presets.detection.blind.ntl.angle_max = 0
	presets.detection.blind.ntl.delay = {
		0,
		0
	}
	presets.detection.blind.ntl.use_uncover_range = false
	presets.dodge = {
		poor = {
			speed = 0.9,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {
						0,
						0
					},
					variations = {side_step = {
						chance = 1,
						timeout = {
							2,
							3
						}
					}}
				},
				scared = {
					chance = 0.5,
					check_timeout = {
						1,
						2
					},
					variations = {side_step = {
						chance = 1,
						timeout = {
							2,
							3
						}
					}}
				}
			}
		},
		average = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.35,
					check_timeout = {
						0,
						0
					},
					variations = {side_step = {
						chance = 1,
						timeout = {
							2,
							3
						}
					}}
				},
				scared = {
					chance = 0.4,
					check_timeout = {
						4,
						7
					},
					variations = {dive = {
						chance = 1,
						timeout = {
							5,
							8
						}
					}}
				}
			}
		},
		heavy = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.75,
					check_timeout = {
						0,
						0
					},
					variations = {
						side_step = {
							chance = 9,
							shoot_chance = 0.8,
							shoot_accuracy = 0.5,
							timeout = {
								0,
								7
							}
						},
						roll = {
							chance = 1,
							timeout = {
								8,
								10
							}
						}
					}
				},
				preemptive = {
					chance = 0.1,
					check_timeout = {
						1,
						7
					},
					variations = {side_step = {
						chance = 1,
						shoot_chance = 1,
						shoot_accuracy = 0.7,
						timeout = {
							1,
							7
						}
					}}
				},
				scared = {
					chance = 0.8,
					check_timeout = {
						1,
						2
					},
					variations = {
						side_step = {
							chance = 5,
							shoot_chance = 0.5,
							shoot_accuracy = 0.4,
							timeout = {
								1,
								2
							}
						},
						roll = {
							chance = 1,
							timeout = {
								8,
								10
							}
						},
						dive = {
							chance = 2,
							timeout = {
								8,
								10
							}
						}
					}
				}
			}
		},
		athletic = {
			speed = 1.3,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {
						0,
						0
					},
					variations = {
						side_step = {
							chance = 5,
							shoot_chance = 0.8,
							shoot_accuracy = 0.5,
							timeout = {
								1,
								3
							}
						},
						roll = {
							chance = 1,
							timeout = {
								3,
								4
							}
						}
					}
				},
				preemptive = {
					chance = 0.35,
					check_timeout = {
						2,
						3
					},
					variations = {
						side_step = {
							chance = 3,
							shoot_chance = 1,
							shoot_accuracy = 0.7,
							timeout = {
								1,
								2
							}
						},
						roll = {
							chance = 1,
							timeout = {
								3,
								4
							}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {
						1,
						2
					},
					variations = {
						side_step = {
							chance = 5,
							shoot_chance = 0.5,
							shoot_accuracy = 0.4,
							timeout = {
								1,
								2
							}
						},
						roll = {
							chance = 3,
							timeout = {
								3,
								5
							}
						},
						dive = {
							chance = 1,
							timeout = {
								3,
								5
							}
						}
					}
				}
			}
		},
		ninja = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {
						0,
						3
					},
					variations = {
						side_step = {
							chance = 3,
							shoot_chance = 1,
							shoot_accuracy = 0.7,
							timeout = {
								1,
								2
							}
						},
						roll = {
							chance = 1,
							timeout = {
								1.2,
								2
							}
						},
						wheel = {
							chance = 2,
							timeout = {
								1.2,
								2
							}
						}
					}
				},
				preemptive = {
					chance = 0.6,
					check_timeout = {
						0,
						3
					},
					variations = {
						side_step = {
							chance = 3,
							shoot_chance = 1,
							shoot_accuracy = 0.8,
							timeout = {
								1,
								2
							}
						},
						roll = {
							chance = 1,
							timeout = {
								1.2,
								2
							}
						},
						wheel = {
							chance = 2,
							timeout = {
								1.2,
								2
							}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {
						0,
						3
					},
					variations = {
						side_step = {
							chance = 5,
							shoot_chance = 0.8,
							shoot_accuracy = 0.6,
							timeout = {
								1,
								2
							}
						},
						roll = {
							chance = 3,
							timeout = {
								1.2,
								2
							}
						},
						wheel = {
							chance = 3,
							timeout = {
								1.2,
								2
							}
						},
						dive = {
							chance = 1,
							timeout = {
								1.2,
								2
							}
						}
					}
				}
			}
		}
	}

	for preset_name, preset_data in pairs(presets.dodge) do
		for reason_name, reason_data in pairs(preset_data.occasions) do
			local total_w = 0

			for variation_name, variation_data in pairs(reason_data.variations) do
				total_w = total_w + variation_data.chance
			end

			if total_w > 0 then
				for variation_name, variation_data in pairs(reason_data.variations) do
					variation_data.chance = variation_data.chance / total_w
				end
			end
		end
	end

	presets.move_speed = {
		civ_fast = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 150,
						bwd = 100
					},
					hos = {
						strafe = 190,
						fwd = 210,
						bwd = 160
					},
					cbt = {
						strafe = 175,
						fwd = 210,
						bwd = 160
					}
				},
				run = {
					hos = {
						strafe = 192,
						fwd = 500,
						bwd = 230
					},
					cbt = {
						strafe = 250,
						fwd = 500,
						bwd = 230
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 160,
						fwd = 174,
						bwd = 163
					},
					cbt = {
						strafe = 160,
						fwd = 174,
						bwd = 163
					}
				},
				run = {
					hos = {
						strafe = 245,
						fwd = 312,
						bwd = 260
					},
					cbt = {
						strafe = 245,
						fwd = 312,
						bwd = 260
					}
				}
			}
		},
		lightning = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 150,
						bwd = 110
					},
					hos = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					},
					cbt = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					}
				},
				run = {
					hos = {
						strafe = 400,
						fwd = 800,
						bwd = 350
					},
					cbt = {
						strafe = 380,
						fwd = 750,
						bwd = 320
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 210,
						fwd = 245,
						bwd = 190
					},
					cbt = {
						strafe = 190,
						fwd = 255,
						bwd = 190
					}
				},
				run = {
					hos = {
						strafe = 300,
						fwd = 420,
						bwd = 250
					},
					cbt = {
						strafe = 300,
						fwd = 412,
						bwd = 280
					}
				}
			}
		},
		very_slow = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					hos = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					}
				},
				run = {
					hos = {
						strafe = 140,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 100,
						fwd = 144,
						bwd = 125
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					}
				},
				run = {
					hos = {
						strafe = 130,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 100,
						fwd = 144,
						bwd = 125
					}
				}
			}
		},
		slow = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					hos = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					}
				},
				run = {
					hos = {
						strafe = 150,
						fwd = 360,
						bwd = 135
					},
					cbt = {
						strafe = 150,
						fwd = 360,
						bwd = 155
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					},
					cbt = {
						strafe = 120,
						fwd = 144,
						bwd = 113
					}
				},
				run = {
					hos = {
						strafe = 140,
						fwd = 360,
						bwd = 150
					},
					cbt = {
						strafe = 140,
						fwd = 360,
						bwd = 155
					}
				}
			}
		},
		normal = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 150,
						bwd = 100
					},
					hos = {
						strafe = 190,
						fwd = 220,
						bwd = 170
					},
					cbt = {
						strafe = 190,
						fwd = 220,
						bwd = 170
					}
				},
				run = {
					hos = {
						strafe = 290,
						fwd = 450,
						bwd = 255
					},
					cbt = {
						strafe = 250,
						fwd = 400,
						bwd = 255
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 170,
						fwd = 210,
						bwd = 160
					},
					cbt = {
						strafe = 170,
						fwd = 210,
						bwd = 160
					}
				},
				run = {
					hos = {
						strafe = 260,
						fwd = 310,
						bwd = 235
					},
					cbt = {
						strafe = 260,
						fwd = 350,
						bwd = 235
					}
				}
			}
		},
		fast = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 150,
						bwd = 110
					},
					hos = {
						strafe = 215,
						fwd = 270,
						bwd = 185
					},
					cbt = {
						strafe = 215,
						fwd = 270,
						bwd = 185
					}
				},
				run = {
					hos = {
						strafe = 315,
						fwd = 625,
						bwd = 280
					},
					cbt = {
						strafe = 285,
						fwd = 450,
						bwd = 280
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 180,
						fwd = 235,
						bwd = 170
					},
					cbt = {
						strafe = 180,
						fwd = 235,
						bwd = 170
					}
				},
				run = {
					hos = {
						strafe = 280,
						fwd = 330,
						bwd = 255
					},
					cbt = {
						strafe = 270,
						fwd = 312,
						bwd = 255
					}
				}
			}
		},
		very_fast = {
			stand = {
				walk = {
					ntl = {
						strafe = 120,
						fwd = 150,
						bwd = 110
					},
					hos = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					},
					cbt = {
						strafe = 225,
						fwd = 285,
						bwd = 215
					}
				},
				run = {
					hos = {
						strafe = 340,
						fwd = 670,
						bwd = 325
					},
					cbt = {
						strafe = 325,
						fwd = 475,
						bwd = 300
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						strafe = 210,
						fwd = 245,
						bwd = 190
					},
					cbt = {
						strafe = 190,
						fwd = 255,
						bwd = 190
					}
				},
				run = {
					hos = {
						strafe = 282,
						fwd = 350,
						bwd = 268
					},
					cbt = {
						strafe = 282,
						fwd = 312,
						bwd = 268
					}
				}
			}
		}
	}

	for speed_preset_name, poses in pairs(presets.move_speed) do
		for pose, hastes in pairs(poses) do
			hastes.run.ntl = hastes.run.hos
		end

		poses.crouch.walk.ntl = poses.crouch.walk.hos
		poses.crouch.run.ntl = poses.crouch.run.hos
		poses.stand.run.ntl = poses.stand.run.hos
		poses.panic = poses.stand
	end

	presets.surrender = {
		always = {base_chance = 1},
		never = {base_chance = 0},
		easy = {
			base_chance = 0.3,
			significant_chance = 0.35,
			reasons = {
				pants_down = 1,
				isolated = 0.08,
				weapon_down = 0.5,
				health = {
					[1.0] = 0.1,
					[0.999] = 0.9
				}
			},
			factors = {
				unaware_of_aggressor = 0.1,
				enemy_weap_cold = 0.11,
				flanked = 0.05,
				aggressor_dis = {
					[300.0] = 0.2,
					[1000.0] = 0
				}
			}
		},
		normal = {
			base_chance = 0.3,
			significant_chance = 0.35,
			reasons = {health = {
				[1.0] = 0.1,
				[0.999] = 0.9
			}},
			factors = {}
		},
		hard = {
			base_chance = 0.35,
			significant_chance = 0.25,
			violence_timeout = 2,
			reasons = {
				pants_down = 0.8,
				weapon_down = 0.2,
				health = {
					[1.0] = 0,
					[0.35] = 0.5
				}
			},
			factors = {
				enemy_weap_cold = 0.05,
				unaware_of_aggressor = 0.1,
				flanked = 0.04,
				isolated = 0.1,
				aggressor_dis = {
					[300.0] = 0.1,
					[1000.0] = 0
				}
			}
		},
		special = {
			base_chance = 0.25,
			significant_chance = 0.25,
			violence_timeout = 2,
			reasons = {
				pants_down = 0.6,
				weapon_down = 0.02,
				health = {
					[0.5] = 0,
					[0.2] = 0.25
				}
			},
			factors = {
				enemy_weap_cold = 0.05,
				unaware_of_aggressor = 0.02,
				isolated = 0.05,
				flanked = 0.015
			}
		}
	}
	presets.suppression = {
		easy = {
			panic_chance_mul = 1,
			duration = {
				10,
				15
			},
			react_point = {
				0,
				2
			},
			brown_point = {
				3,
				5
			}
		},
		hard_def = {
			panic_chance_mul = 0.7,
			duration = {
				5,
				10
			},
			react_point = {
				0,
				2
			},
			brown_point = {
				5,
				6
			}
		},
		hard_agg = {
			panic_chance_mul = 0.7,
			duration = {
				5,
				8
			},
			react_point = {
				2,
				5
			},
			brown_point = {
				5,
				6
			}
		},
		no_supress = {
			panic_chance_mul = 0,
			duration = {
				0.1,
				0.15
			},
			react_point = {
				100,
				200
			},
			brown_point = {
				400,
				500
			}
		}
	}
	presets.enemy_chatter = {
		no_chatter = {},
		cop = {
			retreat = true,
			aggressive = true,
			go_go = true,
			contact = true,
			suppress = true
		},
		swat = {
			clear = true,
			ready = true,
			contact = true,
			suppress = true,
			smoke = true,
			retreat = true,
			go_go = true,
			aggressive = true,
			follow_me = true
		},
		shield = {follow_me = true}
	}

	return presets
end