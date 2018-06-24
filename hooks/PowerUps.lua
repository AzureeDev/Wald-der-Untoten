local PowerUps = AmmoClip

function PowerUps:init(unit)
	PowerUps.super.init(self, unit)

	--self._ammo_type = ""
    --self._ammo_box = self._unit:name() == Idstring("units/pickups/ammo/ammo_pickup")
    self._power_up_id = self._power_up_id or nil

    if self._power_up_id then
        self:init_lifetime()
    end
end

function PowerUps:reload_contour()
end

function PowerUps:init_lifetime()
    managers.wdu:wait(30, "lifetime_power_up_" .. self._power_up_id .. "_" .. math.random(0,1000), function()
        if alive(self._unit) then
            self:consume()
        end
    end)
end

function PowerUps:_pickup(unit)
	if self._picked_up then
		return
	end

	local player_manager = managers.player
	local inventory = unit:inventory()

    if not unit:character_damage():dead() and inventory then
        local picked_up = false

        if not self._power_up_id then
            if self._projectile_id then
                if managers.blackmarket:equipped_projectile() == self._projectile_id and not player_manager:got_max_grenades() then
                    player_manager:add_grenade_amount(self._ammo_count or 1)
                    picked_up = true
                end
            end

            if picked_up then
                managers.player:register_grenade(managers.network:session():local_peer():id())
				managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", 16)

                if Network:is_client() then
                    managers.network:session():send_to_host("sync_pickup", self._unit)
                end
    
                unit:sound():play(self._pickup_event or "pickup_ammo", nil, true)

                self:consume()
                return true
            end
        end

        self._picked_up = true

        if self._power_up_id == 1 then  -- MAX AMMO
            managers.wdu:power_ups():execute_max_ammo()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "1" )
        elseif self._power_up_id == 2 then -- DOUBLE POINTS
            managers.wdu:power_ups():execute_double_points()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "2" )
        elseif self._power_up_id == 3 then -- INSTAKILL
            managers.wdu:power_ups():execute_instakill()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "3" )
        elseif self._power_up_id == 4 then -- FIRESALE
            managers.wdu:power_ups():execute_firesale()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "4" )
        elseif self._power_up_id == 5 then -- KABOOM
            managers.wdu:power_ups():execute_kaboom()
            LuaNetworking:SendToPeers( "PWUP_EXECUTE", "5" )
        end

        if Network:is_client() then
            managers.network:session():send_to_host("sync_pickup", self._unit)
        end

        managers.wdu:_element_play_sound({
            name = "power_up_taken",
            file_name = "gift_taken.ogg",
            sound_type = "sfx",
            custom_dir = "sound",
            is_relative = false,
            is_loop = false,
            is_3d = false,
            use_velocity = false
        })

        self:consume()

        --if self._ammo_box then
        --	player_manager:send_message(Message.OnAmmoPickup, nil, unit)
        --end
        
        -- ^ unsure what this does.

        return true
	end

	return false
end

function PowerUps:sync_net_event(event, peer)
end