core:import("CoreMissionScriptElement")
ElementXAudio = ElementXAudio or class(CoreMissionScriptElement.MissionScriptElement)

function ElementXAudio:init(...)
	ElementXAudio.super.init(self, ...)

	self._data = {
		name = "unknown",
		custom_dir = "",
		file_name = "",
		sound_type = "sfx",
		is_relative = false,
		is_loop = false,
		is_3d = false,
		position = "",
		override_volume = -1
	}
end
function ElementXAudio:client_on_executed(...)
	self:on_executed(...)
end

function ElementXAudio:on_executed(instigator)

	if not self._values.enabled then
		self._mission_script:debug_output("Element '" .. self._editor_name .. "' not enabled. Skip.", Color(1, 1, 0, 0))
		return
	end

	self._data.name = self._editor_name .. "_" .. self._id
	self._data.custom_dir = self._values.custom_dir
	self._data.file_name = self._values.file_name
	self._data.sound_type = self._values.sound_type or "sfx"
	self._data.is_relative = self._values.is_relative or false
	self._data.is_loop = self._values.is_loop or false
	self._data.is_3d = self._values.is_3d or false
	self._data.position = self._values.position
	self._data.override_volume = self._values.override_volume or -1

	managers.wdu:_element_play_sound(self._data)
	ElementXAudio.super.on_executed(self, instigator)
end

function ElementXAudio:on_script_activated()
    self._mission_script:add_save_state_cb(self._id)
end

function ElementXAudio:save(data)
    data.save_me = true
    data.enabled = self._values.enabled
end

function ElementXAudio:load(data)
    self:set_enabled(data.enabled)
end
