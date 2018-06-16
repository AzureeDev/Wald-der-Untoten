function GamePlayCentralManager:spawn_pickup(params)
    local function vector_to_string(vec)
        local dataString = "x:{1}-y:{2}-z:{3}"
        dataString = dataString:gsub("{1}", math.round_with_precision(vec.x, 4))
        dataString = dataString:gsub("{2}", math.round_with_precision(vec.y, 4))
        dataString = dataString:gsub("{3}", math.round_with_precision(vec.z, 4))

        return dataString
    end

    local powerups_ids = {
        [1] = Idstring("power_ups/max_ammo/max_ammo"),
        [2] = Idstring("power_ups/double_points/double_points"),
        [3] = Idstring("power_ups/instakill/instakill"),
        [4] = Idstring("power_ups/firesale/firesale"),
        [5] = Idstring("power_ups/nuke/nuke")
    }

    local random_id = math.random(#powerups_ids)
    local random_power_up = powerups_ids[ random_id ]

    if not managers.wdu:_is_solo() then

        local tbl_sync = { random_id, vector_to_string(params.position) }

        local tbl_str = LuaNetworking:TableToString(tbl_sync)

        LuaNetworking:SendToPeers("PowerUpSyncTable", tbl_str)
    end

	World:spawn_unit(random_power_up, params.position, params.rotation)
end