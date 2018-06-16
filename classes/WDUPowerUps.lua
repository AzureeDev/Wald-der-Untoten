WDUPowerUps = WDUPowerUps or class(WDUManager)

function WDUPowerUps:init()
end

function WDUPowerUps:execute_max_ammo()
    local player_unit = managers.player:player_unit()

    if player_unit then
        for id,weapon in pairs( player_unit:inventory():available_selections() ) do
            if alive(weapon.unit) then
                weapon.unit:base():soft_replenish()
                managers.hud:set_ammo_amount( id, weapon.unit:base():ammo_info() )
            end
            
            managers.player:add_grenade_amount(10, true)
            managers.player:add_cable_ties(2)
        end
    end

    if managers.hud then
        managers.hud:show_hint( { text = "Max Ammo!" } )
    end

    self._source = SoundDevice:create_source("max_ammo_announcer")
    self._source:post_event("zm_announcer_max_ammo")
end

function WDUPowerUps:execute_double_points()
    managers.hud._hud_zm_waves:_set_gift_visible("icon_double_points", true) 
    managers.wdu:_setup_event_state("double_points", true)

    self._source = SoundDevice:create_source("double_points_announcer")
    self._source:post_event("zm_announcer_double_points")

    managers.wdu:_element_play_sound({
        name = "double_points_loop",
        file_name = "double_points_loop.ogg",
        sound_type = "sfx",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    managers.wdu:wait(30, "double_points_timer_wait", function()
        managers.wdu:_setup_event_state("double_points", false)
        managers.hud._hud_zm_waves:_set_gift_visible("icon_double_points", false)
    end)
end

function WDUPowerUps:execute_firesale()
    if managers.hud then
        managers.hud._hud_zm_waves:_set_gift_visible("icon_firesale", true) 
    end

    self._source = SoundDevice:create_source("firesale_announcer")
    self._source:post_event("zm_announcer_firesale")
    managers.wdu:_setup_event_state("firesale", true)

    managers.wdu:_element_play_sound({
        name = "firesale_inbound",
        file_name = "firesale.ogg",
        sound_type = "music",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    managers.wdu:wait(30, "firesale_timer_wait", function()
        managers.wdu:_setup_event_state("firesale", false)
        managers.hud._hud_zm_waves:_set_gift_visible("icon_firesale", false)
        managers.wdu.level.active_events.firesale_box_swap = false
    end)
end

function WDUPowerUps:execute_instakill()
    managers.hud._hud_zm_waves:_set_gift_visible("icon_instakill", true)
    managers.wdu:_setup_event_state("instakill", true)
    self._source = SoundDevice:create_source("instakill_announcer")
    self._source:post_event("zm_announcer_instakill")

    managers.wdu:_element_play_sound({
        name = "instakill_loop",
        file_name = "instakill_loop.ogg",
        sound_type = "sfx",
        custom_dir = "sound",
        is_relative = false,
        is_loop = false,
        is_3d = false,
        use_velocity = false
    })

    managers.wdu:wait(30, "instakill_wait", function()
        managers.wdu:_setup_event_state("instakill", false)
        managers.hud._hud_zm_waves:_set_gift_visible("icon_instakill", false)
    end)
end

function WDUPowerUps:execute_kaboom()
    local overlay_effect = {
        blend_mode = "normal",
        sustain = 0,
        play_paused = true,
        fade_in = 0,
        fade_out = 3,
        color = Color(0.65, 1, 1, 1),
        timer = TimerManager:main()
    }
    
    self._source = SoundDevice:create_source("announcer_kaboom")
    self._source:post_event("zm_announcer_kaboom")

    self._source_boom = SoundDevice:create_source("kaboom_boom")
    self._source_boom:post_event("zm_boom")

    managers.overlay_effect:play_effect(overlay_effect)

    local double_point_effect = managers.wdu:_is_event_active("double_points") and 2 or 1

    managers.wdu:wait(1, "kaboom_wait", function()
        local function nukeunit(pawn)
            local col_ray = { }
            col_ray.ray = Vector3(1, 0, 0)
            col_ray.position = pawn.unit:position()
        
            local action_data = {}
            action_data.variant = "explosion"
            action_data.damage = 1000000
            action_data.attacker_unit = nil
            action_data.col_ray = col_ray
        
            pawn.unit:character_damage():damage_explosion(action_data)
        end

        for u_key,u_data in pairs(managers.enemy:all_enemies()) do
            nukeunit(u_data)
        end

        managers.wdu:_add_money_to(managers.wdu:_peer_id(), 400 * double_point_effect)
    end)
end
