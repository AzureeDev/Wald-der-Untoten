core:import("CoreMissionScriptElement")
ElementWave = ElementWave or class(CoreMissionScriptElement.MissionScriptElement)

function ElementWave:init(...)
	ElementWave.super.init(self, ...)
end
function ElementWave:client_on_executed(...)
	self:on_executed(...)
end

function ElementWave:on_executed(instigator)

	if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
    end
    
    local current_wave = managers.wdu:_get_current_wave()

    if self._values.ending_check then
        managers.wdu.level.zombies.killed = managers.wdu.level.zombies.killed + 1

        if managers.wdu.level.zombies.killed == math.floor(managers.wdu.level.zombies.max_spawns) then
            managers.wdu.level.zombies.killed = 0
            managers.wdu.level.zombies.currently_spawned = 0
            managers.wdu:_multiply_zombies_by_wave(current_wave)
            
            ElementWave.super.on_executed(self, instigator)
            return
        end

        return
    end

    if current_wave > 0 then
        managers.hud._hud_zm_waves:_new_animation_wave_start()
        managers.player:add_grenade_amount(2, true)
        tweak_data.character:_multiply_by_wave_nb(current_wave)
    else
        managers.hud._hud_zm_waves:_animate_text_blinking()
    end

    
	ElementWave.super.on_executed(self, instigator)
end

function ElementWave:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementWave:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementWave:load(data)
    self:set_enabled(data.enabled)
end
