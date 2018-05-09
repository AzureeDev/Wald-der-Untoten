function UnitNetworkHandler:give_weapon(is_secondary, weapon_factory_id, skin_id)
    if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end

    local primary = {
        equipped = true,
        factory_id = weapon_factory_id,
        blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(weapon_factory_id),
        weapon_id = managers.weapon_factory:get_weapon_id_by_factory_id(weapon_factory_id),
        global_values = {}
    }

    local primary_slot = managers.blackmarket:equipped_weapon_slot(is_secondary)
    local texture_switches = managers.blackmarket:get_weapon_texture_switches(is_secondary, primary_slot, primary)

    local cosmetics = nil
    local cosmetics_string = skin_id or "nil" .. "-1-0"
    local cosmetics_data = string.split(cosmetics_string, "-")
    local weapon_skin_id = cosmetics_data[1] or "nil"
    local quality_index_s = cosmetics_data[2] or "1"
    local bonus_id_s = cosmetics_data[3] or "0"
    if weapon_skin_id ~= "nil" then
        local quality = tweak_data.economy:get_entry_from_index("qualities", tonumber(quality_index_s))
        local bonus = bonus_id_s == "1" and true or false
        cosmetics = {
            id = weapon_skin_id,
            quality = quality,
            bonus = bonus
        }
    end

    local params = {
        weapon_id = primary.factory_id,
        equip = primary.equipped,
        instant = false,
        blueprint = primary.blueprint,
        cosmetics = cosmetics,
        texture_switch = texture_switches
    }

    managers.player:player_unit():inventory():add_unit_by_factory_name(params.weapon_id, params.equip, params.instant, params.blueprint, params.cosmetics, params.texture_switch)
end
