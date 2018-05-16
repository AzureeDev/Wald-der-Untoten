Hooks:PostHook(TweakData, "init", "zm_post_tweakdata_init", function(self)
    self.projectiles.launcher_frag_arbiter.damage = 150

    self.projectiles.frag_com.damage = 160
    self.projectiles.fir_com.damage = 15
end)