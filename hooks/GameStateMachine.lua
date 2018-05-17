core:module("CoreGameStateMachine")
core:import("CoreInitState")

function GameStateMachine:init(start_state)
	self._states = {}
	self._transitions = {}
	local init = CoreInitState._InitState:new(self)
	self._states[init:name()] = init
	self._transitions[init] = self._transitions[init] or {}
	self._transitions[init][start_state] = init.default_transition
	self._current_state = init
	self._queued_transitions = {{start_state}}

	self:_do_state_change()
end

function GameStateMachine:add_transition(from, to, trans_func)
	self._states[from:name()] = from
	self._states[to:name()] = to
	self._transitions[from] = self._transitions[from] or {}
	self._transitions[from][to] = trans_func
end

function GameStateMachine:can_change_state(state)
	local state_from = self._queued_transitions and self._queued_transitions[#self._queued_transitions][1] or self._current_state
	local valid_transitions = self._transitions[state_from]

	return valid_transitions and valid_transitions[state] ~= nil
end

function GameStateMachine:_do_state_change()
	if not self._queued_transitions then
		return
	end

	self._doing_state_change = true

	for i_transition, transition in ipairs(self._queued_transitions) do
		local new_state = transition[1]
		local params = transition[2]
		local old_state = self._current_state
		local trans_func = self._transitions[old_state][new_state]

		cat_print("game_state_machine", "[GameStateMachine] Executing state change '" .. tostring(old_state:name()) .. "' --> '" .. tostring(new_state:name()) .. "'")

		self._current_state = new_state

		trans_func(old_state, new_state, params)
	end

	self._queued_transitions = nil
	self._doing_state_change = false
end