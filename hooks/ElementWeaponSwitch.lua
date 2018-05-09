core:import("CoreMissionScriptElement")
ElementWeaponSwitch = ElementWeaponSwitch or class(CoreMissionScriptElement.MissionScriptElement)

function ElementWeaponSwitch:init(...)
	ElementWeaponSwitch.super.init(self, ...)
end

function ElementWeaponSwitch:client_on_executed(...)
    self:on_executed(...)
end

function ElementWeaponSwitch:on_executed(instigator)
    if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
    end

    -- Base Factory ID before assuming the current slot
    local factory_id = self._values.weapon_id or "wpn_fps_ass_m4"

    -- Random factory weapon if the interaction is on a mystery box
    if self._values.is_mystery_box then
        factory_id = self:_get_random_weapon()
    end
    
    -- Script used to get the start weapons
    local current_index_equipped = instigator:inventory():equipped_selection()
    local index_wtf = current_index_equipped == 1 and true or false
    if not self._values.force_classic_id then
        local endfix = ""
        if current_index_equipped == 1 then
            endfix = "_secondary"
        else
            endfix = "_primary"
        end
        factory_id = factory_id .. endfix
    end

    -- Get the upgraded weapon ID if the pack-a-punch box is used.
    if self._values.is_pap_engine then
        local current_peer_weapon = instigator:inventory():equipped_unit():base()._factory_id
        local clbk_gpwbf = self:_get_punched_weapon_by_factory(current_peer_weapon)
        if clbk_gpwbf then
            factory_id = clbk_gpwbf
        end
    end

    -- Then we init the blueprint, depending if it's a string or table
    local blueprint_fucking_ovk
    local blueprint_table = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
    local blueprint_to_string = managers.weapon_factory:blueprint_to_string(factory_id, blueprint_table)

    -- thanks ovk
    if instigator ~= managers.player:player_unit() then
        blueprint_fucking_ovk = blueprint_to_string
    else
        blueprint_fucking_ovk = blueprint_table
    end

    -- Init Skin
    local cosmetics
    local cosmetics_string = self._values.skin_id or "nil" .. "-1-0"
    local cosmetics_data = string.split(cosmetics_string, "-")
    local weapon_skin_id = cosmetics_data[1] or "nil"
    local quality_index_s = cosmetics_data[2] or "1"
    local bonus_id_s = cosmetics_data[3] or "0"
    if weapon_skin_id ~= "nil" then
        local quality = tweak_data.economy:get_entry_from_index("qualities", tonumber(quality_index_s))
        local bonus = bonus_id_s == "1" and true or false
        cosmetics = "pap-1-0"

        if instigator == managers.player:player_unit() then
            cosmetics = {
                id = weapon_skin_id,
                quality = quality,
                bonus = bonus
            }
        end
    end

    -- Init final table
    local new_weapon_data = {
        equip = index_wtf,
        factory_id = factory_id,
        blueprint = blueprint_fucking_ovk,
        global_values = {},
        instant = false,
        cosmetics = cosmetics or "nil-1-0"
    }
    
    -- Adding the weapon
    if self._values.instigator_only then
        instigator:inventory():add_unit_by_factory_name(new_weapon_data.factory_id, new_weapon_data.equip, new_weapon_data.instant, new_weapon_data.blueprint, new_weapon_data.cosmetics)
        if instigator:movement().sync_equip_weapon then
            instigator:movement():sync_equip_weapon()
        end
        if instigator:inventory().equip_selection then
            instigator:inventory():equip_selection(current_index_equipped, false)
        end
    else
        managers.player:player_unit():inventory():add_unit_by_factory_name(new_weapon_data.factory_id, new_weapon_data.equip, new_weapon_data.instant, new_weapon_data.blueprint, new_weapon_data.cosmetics)
        if managers.player:player_unit():movement().sync_equip_weapon then
            managers.player:player_unit():movement():sync_equip_weapon()
        end
        if  managers.player:player_unit():inventory().equip_selection then
            managers.player:player_unit():inventory():equip_selection(current_index_equipped, false)
        end
    end

    ElementWeaponSwitch.super.on_executed(self, instigator)
end

function ElementWeaponSwitch:_get_random_weapon()
	local table_available_weapons_mystery_box = {
		"wpn_fps_spe_wunderwaffe",
		"wpn_fps_special_roach",
		"wpn_fps_ass_m14",
		"wpn_fps_shot_b682",
		"wpn_fps_smg_mp9",
		"wpn_fps_snp_m95",
		"wpn_fps_ass_fal",
		"wpn_fps_pis_deagle",
		"wpn_fps_ass_aug",
		"wpn_fps_smg_p90",
		"wpn_fps_sho_striker",
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_ass_scar",
		"wpn_fps_pis_judge",
		"wpn_fps_smg_thompson",
		"wpn_fps_lmg_hk21",
		"wpn_fps_lmg_m249",
		"wpn_fps_pis_rage",
		"wpn_fps_pis_peacemaker",
		"wpn_fps_ass_flint",
		"wpn_fps_pis_breech",
		"wpn_fps_spe_rpg7"
	}
	
	if managers.player._wunderwaffe_unlocked then
		table.remove(table_available_weapons_mystery_box, 1)
	end
	
	if managers.player._roach_unlocked and not managers.player._wunderwaffe_unlocked then
		table.remove(table_available_weapons_mystery_box, 2)
	elseif managers.player._roach_unlocked and managers.player._wunderwaffe_unlocked then
		table.remove(table_available_weapons_mystery_box, 1)
	end

	local random_entry = table_available_weapons_mystery_box[math.random(#table_available_weapons_mystery_box)]

	return random_entry
end

function ElementWeaponSwitch:_get_punched_weapon_by_factory(factory)
	local tbl = {
		wpn_fps_spe_wunderwaffe_primary = "wpn_fps_spe_wunderwaffe_dg3_primary",
		wpn_fps_spe_wunderwaffe_secondary = "wpn_fps_spe_wunderwaffe_dg3_secondary",
		wpn_fps_ass_m14_primary = "wpn_fps_ass_m14_upg_primary",
		wpn_fps_ass_m14_secondary = "wpn_fps_ass_m14_upg_secondary",
		wpn_fps_snp_m95_primary = "wpn_fps_snp_m95_upg_primary",
		wpn_fps_snp_m95_secondary = "wpn_fps_snp_m95_upg_secondary",
		wpn_fps_smg_mp9_primary = "wpn_fps_smg_mp9_upg_primary",
		wpn_fps_smg_mp9_secondary = "wpn_fps_smg_mp9_upg_secondary",
		wpn_fps_shot_b682_primary = "wpn_fps_shot_b682_upg_primary",
		wpn_fps_shot_b682_secondary = "wpn_fps_shot_b682_upg_secondary",
		wpn_fps_pis_1911_primary = "wpn_fps_pis_1911_upg_primary",
		wpn_fps_pis_1911_secondary = "wpn_fps_pis_1911_upg_secondary",
		wpn_fps_ass_fal_primary = "wpn_fps_ass_fal_upg_primary",
		wpn_fps_ass_fal_secondary = "wpn_fps_ass_fal_upg_secondary",
		wpn_fps_pis_deagle_primary = "wpn_fps_pis_deagle_upg_primary",
		wpn_fps_pis_deagle_secondary = "wpn_fps_pis_deagle_upg_secondary",
		wpn_fps_ass_aug_primary = "wpn_fps_ass_aug_upg_primary",
		wpn_fps_ass_aug_secondary = "wpn_fps_ass_aug_upg_secondary",
		wpn_fps_smg_p90_primary = "wpn_fps_smg_p90_upg_primary",
		wpn_fps_smg_p90_secondary = "wpn_fps_smg_p90_upg_secondary",
		wpn_fps_sho_striker_primary = "wpn_fps_sho_striker_upg_primary",
		wpn_fps_sho_striker_secondary = "wpn_fps_sho_striker_upg_secondary",
		wpn_fps_ass_amcar_primary = "wpn_fps_ass_amcar_upg_primary",
		wpn_fps_ass_amcar_secondary = "wpn_fps_ass_amcar_upg_secondary",
		wpn_fps_ass_m16_primary = "wpn_fps_ass_m16_upg_primary",
		wpn_fps_ass_m16_secondary = "wpn_fps_ass_m16_upg_secondary",
		wpn_fps_ass_scar_primary = "wpn_fps_ass_scar_upg_primary",
		wpn_fps_ass_scar_secondary = "wpn_fps_ass_scar_upg_secondary",
		wpn_fps_pis_judge_primary = "wpn_fps_pis_judge_upg_primary",
		wpn_fps_pis_judge_secondary = "wpn_fps_pis_judge_upg_secondary",
		wpn_fps_smg_thompson_primary = "wpn_fps_smg_thompson_upg_primary",
		wpn_fps_smg_thompson_secondary = "wpn_fps_smg_thompson_upg_secondary",
		wpn_fps_lmg_hk21_primary = "wpn_fps_lmg_hk21_upg_primary",
		wpn_fps_lmg_hk21_secondary = "wpn_fps_lmg_hk21_upg_secondary",
		wpn_fps_lmg_m249_primary = "wpn_fps_lmg_m249_upg_primary",
		wpn_fps_lmg_m249_secondary = "wpn_fps_lmg_m249_upg_secondary",
		wpn_fps_pis_rage_primary = "wpn_fps_pis_rage_upg_primary",
		wpn_fps_pis_rage_secondary = "wpn_fps_pis_rage_upg_secondary",
		wpn_fps_pis_peacemaker_primary = "wpn_fps_pis_peacemaker_upg_primary",
		wpn_fps_pis_peacemaker_secondary = "wpn_fps_pis_peacemaker_upg_secondary",
		wpn_fps_ass_flint_primary = "wpn_fps_ass_flint_upg_primary",
		wpn_fps_ass_flint_secondary = "wpn_fps_ass_flint_upg_secondary",
		wpn_fps_pis_breech_primary = "wpn_fps_pis_breech_upg_primary",
		wpn_fps_pis_breech_secondary = "wpn_fps_pis_breech_upg_secondary"
	}

	local punch_tbl = {}

	for k, v in pairs(tbl) do
		table.insert(punch_tbl, v)
	end

	for _, v in ipairs(punch_tbl) do -- Refill ammo on punched weapon.
		if v == factory then
			return v
		end
	end

	for k, v in pairs(tbl) do
		if k == factory then
			return v
		end
	end

	return "wpn_fps_ass_m4"
end

function ElementWeaponSwitch:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementWeaponSwitch:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementWeaponSwitch:load(data)
    self:set_enabled(data.enabled)
end