core:import("CoreMissionScriptElement")
ElementPointChecker = ElementPointChecker or class(CoreMissionScriptElement.MissionScriptElement)

function ElementPointChecker:init(...)
	ElementPointChecker.super.init(self, ...)
end
function ElementPointChecker:client_on_executed(...)
	self:on_executed(...)
end

function ElementPointChecker:on_executed(instigator)

	if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
	end

	local peer = managers.network:session():peer_by_unit(instigator)
	local peer_id = peer:id() or 1

	local current_points = tonumber(managers.statistics._zm_points[peer_id])
	if current_points < self._values.cost then
		return
	end

	managers.statistics:_remove_zm_points(self._values.cost, peer_id)
	ElementPointChecker.super.on_executed(self, instigator)
end

function ElementPointChecker:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementPointChecker:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementPointChecker:load(data)
    self:set_enabled(data.enabled)
end
