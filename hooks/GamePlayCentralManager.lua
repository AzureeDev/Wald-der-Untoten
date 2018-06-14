function GamePlayCentralManager:spawn_pickup(params)
    local powerups_ids = {
        [1] = Idstring("power_ups/max_ammo/max_ammo"),
        [2] = Idstring("power_ups/double_points/double_points"),
        [3] = Idstring("power_ups/instakill/instakill"),
        [4] = Idstring("power_ups/firesale/firesale"),
        [5] = Idstring("power_ups/nuke/nuke")
    }

    local random_power_up = powerups_ids[ math.random(#powerups_ids) ]

	World:spawn_unit(random_power_up, params.position, params.rotation)
end