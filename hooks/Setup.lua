dofile(ModPath .. "classes/WDUManager.lua")

Hooks:PostHook(GameSetup, "init_managers", "zm_init_wdumanager", function(self, managers)
	managers.wdu = WDUManager:new()
end)