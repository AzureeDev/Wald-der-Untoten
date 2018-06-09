Hooks:PostHook(StatisticsManager, "killed", "zm_init_add_zmpoints", function(self, data)

    local double_point_effect = managers.wdu.level.active_events.double_points and 2 or 1
    local peer_id = managers.wdu:_peer_id()
	local by_melee = data.variant == "melee" or data.weapon_id and tweak_data.blackmarket.melee_weapons[data.weapon_id]
    local points_to_add = 0
    local category
       
    if by_melee then
        category = "on_melee_kill"
        points_to_add = managers.wdu:_get_points_amount(category) * double_point_effect

        managers.wdu:_add_money_to(peer_id, points_to_add)

    else
        category = "on_kill"
        points_to_add = managers.wdu:_get_points_amount(category, data.name) + (data.head_shot and managers.wdu:_get_points_amount("on_headshot") or 0) * double_point_effect

        managers.wdu:_add_money_to(peer_id, points_to_add)
    end

    if alive(managers.player:player_unit()) then
        local random = math.random(0, 100)

        if random <= 2 then
            managers.player:player_unit():sound():say("v46", true, true)
        end
    end
end)