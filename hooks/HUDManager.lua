function HUDManager:start_assault(assault_number)
	self._hud.in_assault = true
	managers.network:session():send_to_peers_synched("sync_start_assault", math.min(assault_number, HUDManager.ASSAULTS_MAX))
end

function HUDManager:remove_teammate_panel(id)
	local prev_peer_id_disconnected = self._teammate_panels[id]._peer_id

	if self._hud_zm_points and prev_peer_id_disconnected then
		self._hud_zm_points._zmp_avatars[prev_peer_id_disconnected]:set_visible(false)
		self._hud_zm_points._zmp_points[prev_peer_id_disconnected]:set_visible(false)
	end

	self._teammate_panels[id]:remove_panel()

	local panel_data = self._hud.teammate_panels_data[id]
	panel_data.taken = false
	local is_ai = self._teammate_panels[HUDManager.PLAYER_PANEL]._ai

	if self._teammate_panels[HUDManager.PLAYER_PANEL]._peer_id and self._teammate_panels[HUDManager.PLAYER_PANEL]._peer_id ~= managers.network:session():local_peer():id() or is_ai then
		local peer_id = self._teammate_panels[HUDManager.PLAYER_PANEL]._peer_id

		self:remove_teammate_panel(HUDManager.PLAYER_PANEL)

		if is_ai then
			local character_name = managers.criminals:character_name_by_panel_id(HUDManager.PLAYER_PANEL)
			local name = managers.localization:text("menu_" .. character_name)
			local panel_id = self:add_teammate_panel(character_name, name, true, nil)
			managers.criminals:character_data_by_name(character_name).panel_id = panel_id
		else
			local character_name = managers.criminals:character_name_by_peer_id(peer_id)
			local panel_id = self:add_teammate_panel(character_name, managers.network:session():peer(peer_id):name(), false, peer_id)
			managers.criminals:character_data_by_name(character_name).panel_id = panel_id
		end
	end

	managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:add_panel()
	managers.hud._teammate_panels[HUDManager.PLAYER_PANEL]:set_state("player")
end
