function safe_spawn_unit(unit_name, ...)

    local arg = {...}
    local pos = arg[1]

    if managers and managers.wdu then
        if managers.wdu:_is_special_wave() then
            --if not Network:is_server() then

                if pos then
                    World:effect_manager():spawn({
                        effect = Idstring("effects/zm/zm_special_spawn"),
                        position = pos
                    })
                end

                managers.wdu:_element_play_sound({
                    name = "play_sound_spawn",
                    custom_dir = "sound",
                    file_name = "special_spawn.ogg",
                    is_loop = false,
                    is_relative = false
                })

                DelayedCalls:Add("zm_shake_little_delay", 1.6, function()
                    if alive(managers.player:player_unit()) then
                        local feedback = managers.feedback:create("mission_triggered")
                        feedback:set_unit(managers.player:player_unit())
                        feedback:set_enabled("camera_shake", true)
                        feedback:set_enabled("rumble", true)
                        feedback:set_enabled("above_camera_effect", false)

                        local params = {
                            "camera_shake",
                            "multiplier",
                            1,
                            "camera_shake",
                            "amplitude",
                            0.5,
                            "camera_shake",
                            "attack",
                            0.05,
                            "camera_shake",
                            "sustain",
                            0.15,
                            "camera_shake",
                            "decay",
                            0.5,
                            "rumble",
                            "multiplier_data",
                            1,
                            "rumble",
                            "peak",
                            0.5,
                            "rumble",
                            "attack",
                            0.05,
                            "rumble",
                            "sustain",
                            0.15,
                            "rumble",
                            "release",
                            0.5
                        }

                        feedback:play(unpack(params))
                    end
                end)
           -- end
        end
    end

	if editor_load_unit(unit_name) then
		return World:spawn_unit(unit_name:id(), ...)
	end
end