Hooks:PostHook(HUDMissionBriefing, "init", "zm_postinit_music", function(self, hud, workspace)
    DelayedCalls:Add("zm_remove_current_song", 0.05, function()
        managers.music:post_event("stop_all_music")
    end)

    managers.music:post_event("zm_pregame")
end)