function WeaponFactoryManager:unpack_blueprint_from_string(factory_id, blueprint_string)
    log("attempting to unpack the blueprint of: ", tostring(factory_id), "with a blueprint:", tostring(blueprint_string))

	local factory = tweak_data.weapon.factory
	local index_table = string.split(blueprint_string, " ")
	local blueprint = {}
	local part_id = nil

	for _, part_index in ipairs(index_table) do
		part_id = factory[factory_id].uses_parts[tonumber(part_index)]

		if part_id then
			table.insert(blueprint, part_id)
		end
	end

	return blueprint
end