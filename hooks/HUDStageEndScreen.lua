Hooks:PostHook(HUDStageEndScreen, "set_success", "zm_modify_header", function(self, success, server_left)
    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
	self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)

Hooks:PostHook(HUDStageEndScreen, "set_statistics", "zm_modify_header2", function(self, criminals_completed, success)
    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
    self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)

Hooks:PostHook(HUDStageEndScreen, "stage_money_counter_init", "zm_music_over", function(self, t, dt)
    Global.music_manager.source:post_event("stop_all_music")

    self._source = SoundDevice:create_source("zm_dead_end")
    self._source:post_event("zm_dead")

    local total = managers.hud._hud_zm_waves._current_wave
    local s = ""

    if total > 1 then
        s = "s"
    end

    local wave_survived = self._package_forepanel:text({
        text = "You Survived " .. total .. " Round" .. s,
        font = tweak_data.menu.pd2_large_font,
        font_size = tweak_data.menu.pd2_large_font_size,
        color = Color.white,
        visible = true,
        align = "center",
        valign = "center",
        vertical = "center"
    })

    wave_survived:set_world_center_y(self._package_forepanel:world_center_y())

    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
	self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)
