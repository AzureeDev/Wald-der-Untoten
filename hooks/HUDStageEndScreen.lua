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

    local peer_id = managers.wdu:_peer_id()
    local current_highscore = managers.wdu:_get_current_highscore_of(id)
    local total = managers.wdu.level.wave.current
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
        y = 10
    })



    for i, player_data in ipairs(managers.wdu.players) do
        local highscore_text_players = {}
        local name = player_data.name
        local hs_waves = tostring(player_data.max_waves_survived)
        
        if current_wave > player_data.max_waves_survived then
            managers.wdu:_save_new_highscore(current_wave)
        end

        if i == 1 then
            highscore_text_players[1] = self._package_forepanel:text({
                text = name .. " survived a maximum of " .. hs_waves .. " waves",
                font_size = tweak_data.menu.pd2_large_font_size - 8,
                color = Color.white,
                visible = true,
                align = "center"
            })
            highscore_text_players[1]:set_top(wave_survived:bottom() + 10)
        else
            highscore_text_players[i] = self._package_forepanel:text({
                text = name .. " survived a maximum of " .. hs_waves .. " waves",
                font_size = tweak_data.menu.pd2_large_font_size - 8,
                color = Color.white,
                visible = true,
                align = "center"
            })
    
            highscore_text_players[i]:set_top(highscore_text_players[i - 1]:bottom() + 10)
        end
    end

    self._foreground_layer_safe:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
	self._background_layer_full:child("stage_text"):set_text(self._stage_name .. ": GAME OVER")
end)
