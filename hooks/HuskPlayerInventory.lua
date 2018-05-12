function HuskPlayerInventory:add_unit_by_factory_name(factory_name, equip, instant, blueprint_string, cosmetics_string)

    log("the factory name received is ", tostring(factory_name))

	local factory_weapon = tweak_data.weapon.factory[factory_name]
	local ids_unit_name = Idstring(factory_weapon.unit)

    managers.dyn_resource:load(Idstring("unit"), ids_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)

	local blueprint = nil
	log("received blueprint from string by husk: factory_name:", tostring(factory_name), "blueprint_string:", tostring(blueprint_string))
	log("unpacking..")
	blueprint = blueprint_string and blueprint_string ~= "" and managers.weapon_factory:unpack_blueprint_from_string(factory_name, blueprint_string) or managers.weapon_factory:get_default_blueprint_by_factory_id(factory_name)
	local cosmetics = nil
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

	self:add_unit_by_factory_blueprint(factory_name, equip, instant, blueprint, cosmetics)
end