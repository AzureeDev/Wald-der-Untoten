Hooks:PostHook(CopActionWalk, "init", "zm_force_run", function(self, action_desc, common_data)
    self._no_walk = true
	self._no_strafe = true
end)