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

	local current_points = tonumber(managers.wdu.players[peer_id].money)
	if current_points < self._values.cost then
		managers.wdu:_element_play_sound({
			name = self._editor_name .. "_" .. self._id,
			custom_dir = "sound",
			file_name = "denied.ogg",
			sound_type = "sfx",
			is_3d = true,
			position = self._values.position
		})
		return
	end

	managers.wdu:_element_play_sound({
		name = self._editor_name .. "_" .. self._id,
		custom_dir = "sound",
		file_name = "cashin.ogg",
		sound_type = "sfx",
		is_3d = true,
		position = self._values.position
	})

	local C = self._values.cost
	local D = 0 - C

	if instigator == managers.player:player_unit() then
		managers.wdu:_add_money_to(peer_id, D)
	end

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
