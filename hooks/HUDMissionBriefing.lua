Hooks:PostHook(HUDMissionBriefing, "init", "zm_postinit_music", function(self, hud, workspace)
    DelayedCalls:Add("zm_remove_current_song", 0.05, function()
        managers.music:post_event("stop_all_music")
    end)

    managers.music:post_event("zm_pregame")
end)

Hooks:PostHook(HUDMissionBriefing, "set_player_slot", "zm_postinit_set_player", function(self, nr, params)
    local current_name = params.name
    local peer_id = params.peer_id

    local data = {
        id = peer_id,
        name = current_name
    }

    managers.wdu:_init_new_player(data)
end)