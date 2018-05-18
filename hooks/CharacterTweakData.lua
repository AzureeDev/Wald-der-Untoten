function CharacterTweakData:_multiply_by_wave_nb(wave)
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
	self.fbi.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_swat", "zm_disable_surrenders_2", function(self, presets)
	self.swat.surrender = nil
	self.swat.rescue_hostages = false
	self.swat.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_heavy_swat", "zm_disable_surrenders_3", function(self, presets)
	self.heavy_swat.surrender = nil
	self.heavy_swat.rescue_hostages = false
	self.heavy_swat.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_fbi_swat", "zm_disable_surrenders_4", function(self, presets)
	self.fbi_swat.surrender = nil
	self.fbi_swat.rescue_hostages = false
	self.fbi_swat.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_fbi_heavy_swat", "zm_disable_surrenders_5", function(self, presets)
	self.fbi_heavy_swat.surrender = nil
	self.fbi_heavy_swat.rescue_hostages = false
	self.fbi_heavy_swat.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_city_swat", "zm_disable_surrenders_6", function(self, presets)
	self.city_swat.surrender = nil
	self.city_swat.rescue_hostages = false
	self.city_swat.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_medic", "zm_med_tweak", function(self, presets)
	self.medic.rescue_hostages = false
	self.medic.suppression = nil
	self.medic.dodge = nil
end)

Hooks:PostHook(CharacterTweakData, "_init_taser", "zm_taser_tweak", function(self, presets)
	self.taser.dodge = nil
end)
