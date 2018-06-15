HUDZMWaves = HUDZMWaves or class()

function HUDZMWaves:init(parent)
    self:_create_zm_waves_hud(parent)
    self:_create_gift_hud(parent)
end

function HUDZMWaves:_create_zm_waves_hud(parent)
    local zm_wave_panel = parent:panel({
        name = "zm_wave_panel",
        w = 275,
        h = 35
    })
    self._panel = zm_wave_panel

    local zm_wave_text = zm_wave_panel:text({
        name = "zm_wave_text",
        vertical = "center",
        y = 0,
        x = 10,
        layer = 1,
        text = "",
        color = Color(1, 0.6, 0, 0),
        font_size = tweak_data.menu.pd2_large_font_size,
        font = tweak_data.menu.pd2_large_font,
        visible = true
    })
    zm_wave_text:set_world_center_y(zm_wave_panel:world_center_y())

    self._zm_wave_text = zm_wave_text
end

function HUDZMWaves:_create_gift_hud(parent)
    local is_firesale = managers.wdu:_is_event_active("firesale")
    local is_instakill = managers.wdu:_is_event_active("instakill")
    local is_double_points = managers.wdu:_is_event_active("double_points")

    local gift_panel = parent:panel({
        name = "gift_panel",
        w = parent:w(),
        h = 64
    })
    gift_panel:set_y(parent:bottom() - 200)

    self.gift_panel = gift_panel

    local weapon_name_bottom_right = gift_panel:text({
        font = "fonts/font_large_mf",
        font_size = 18,
        color = Color(0.8, 0.8, 0.8),
        text = "",
        align = "right",
        vertical = "bottom",
        valign = "bottom"
    })
    weapon_name_bottom_right:set_center_x(parent:center_x())
    weapon_name_bottom_right:set_text(managers.localization:text("wpn_m1911_name"))

    self.weapon_name_bottom_right = weapon_name_bottom_right

    local icon_instakill = gift_panel:bitmap({
        name = "icon_instakill",
        texture = "perks/gift_instakill",
        w = 64,
        h = 64,
        visible = is_instakill
    })
    icon_instakill:set_center_x(parent:center_x())

    local icon_firesale = gift_panel:bitmap({
        name = "icon_firesale",
        texture = "perks/gift_firesale",
        w = 64,
        h = 64,
        visible = is_firesale
    })
    icon_firesale:set_right(icon_instakill:left())

    local icon_double_points = gift_panel:bitmap({
        name = "icon_double_points",
        texture = "perks/gift_double_points",
        w = 64,
        h = 64,
        visible = is_double_points
    })
    icon_double_points:set_left(icon_instakill:right())
end

function HUDZMWaves:_set_gift_visible(gift, visible)
    local texture = self.gift_panel:child(gift)
    texture:set_visible(visible)

    local function animate_icon_lifetime(o)
        o:stop()

        local from = 1
        local to = 0
        local t = 0

        o:set_alpha(from)
        wait(18)
        
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)
        o:set_alpha(to)
        wait(0.25)
        o:set_alpha(from)
        wait(0.25)

        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)

        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)

        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)

        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)

        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)

        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)
        o:set_alpha(to)
        wait(0.1)
        o:set_alpha(from)
        wait(0.1)

        o:set_alpha(to)

        
    end

    texture:animate(animate_icon_lifetime)
end

function HUDZMWaves:_new_animation_wave_start()
    local function anim_blink_white(o)
        o:set_color(Color(1, 1, 1, 1))
        managers.trade:set_trade_countdown(true)

        over(0.5, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)
        
        over(0.5, function (p)
			o:set_color(o:color():with_alpha(p))
        end)
        
        over(1, function (p)
			o:set_color(o:color():with_alpha(1 - p))
        end)

        managers.wdu.level.wave.current = managers.wdu.level.wave.current + 1
        local text_wave = ""

        self._zm_wave_text:set_text(text_wave .. managers.wdu.level.wave.current)
        
        wait(1)

        managers.trade:set_trade_countdown(false)
        
        local from = Color(0, 1, 1, 1)
        local to = Color(1, 1, 1, 1)
        local t = 0

        o:set_color(from)

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt
        end

        t = 0

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt

            o:set_color(from * (1 - t) + to * t)
        end

        o:set_color(to)

        local from = Color(1, 1, 1, 1)
        local to = Color(1, 0.6, 0, 0)
        local t = 0

        o:set_color(from)

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt
        end

        t = 0

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt

            o:set_color(from * (1 - t) + to * t)
        end

        o:set_color(to)
    end

    self._zm_wave_text:animate(anim_blink_white)
end

function HUDZMWaves:_animate_text_blinking()
    local function animate_text_blinking(o)
        local from = Color(1, 0.6, 0, 0)
        local to = Color(0, 0.6, 0, 0)
        local t = 0

        o:set_color(from)

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt
        end

        t = 0

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt

            o:set_color(from * (1 - t) + to * t)
        end

        o:set_color(to)

        managers.wdu.level.wave.current = managers.wdu.level.wave.current + 1
        self._zm_wave_text:set_text(managers.wdu.level.wave.current)

        managers.trade:set_trade_countdown(true)

        wait(10)

        managers.trade:set_trade_countdown(false)
        
        local from = Color(0, 0.6, 0, 0)
        local to = Color(1, 0.6, 0, 0)
        local t = 0

        o:set_color(from)

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt
        end

        t = 0

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt

            o:set_color(from * (1 - t) + to * t)
        end

        o:set_color(to)
	end

    self._zm_wave_text:animate(animate_text_blinking)
end

HUDZMPoints = HUDZMPoints or class()

function HUDZMPoints:init(parent)
    self:_create_zm_hud(parent)
end

function HUDZMPoints:_create_zm_hud(parent)
    local padding = 5

    local zm_points_panel = parent:panel({
        name = "zm_point_panel",
        w = 300,
        h = 250
    })
    self._panel = zm_points_panel
    self._panel:set_top(managers.hud._hud_zm_waves._panel:bottom() + 40)

    local zm_points_panel_rect = zm_points_panel:rect({
        name = "background",
        color = Color.black,
        alpha = 0.4,
        visible = false,
        layer = -1,
        halign = "scale",
        valign = "scale"
    })

    local peer_1_avatar = zm_points_panel:bitmap({
        texture = "guis/textures/pd2/none_icon",
        h = 40,
        w = 40,
        x = 0,
        y = 5,
        visible = false
    })

    local peer_1_points = zm_points_panel:text({
        name = "peer_1_points",
        vertical = "center",
        valign = "center",
        x = -10,
        y = 5,
        text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        color = tweak_data.chat_colors[1],
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font,
        visible = false
    })
    managers.hud:make_fine_text(peer_1_points)
    peer_1_points:set_left(peer_1_avatar:right() + 15)
    peer_1_points:set_world_center_y(peer_1_avatar:world_center_y())

    local peer_2_avatar = zm_points_panel:bitmap({
        texture = "guis/textures/pd2/none_icon",
        h = 40,
        w = 40,
        visible = false
    })
    peer_2_avatar:set_left(peer_1_avatar:left())
    peer_2_avatar:set_top(peer_1_avatar:bottom() + padding)

    local peer_2_points = zm_points_panel:text({
        name = "peer_2_points",
        vertical = "center",
        valign = "center",
        text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        color = tweak_data.chat_colors[2],
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font,
        visible = false
    })
    managers.hud:make_fine_text(peer_2_points)
    peer_2_points:set_left(peer_1_points:left())
    peer_2_points:set_world_center_y(peer_2_avatar:world_center_y())

    local peer_3_avatar = zm_points_panel:bitmap({
        texture = "guis/textures/pd2/none_icon",
        h = 40,
        w = 40,
        visible = false
    })
    peer_3_avatar:set_left(peer_2_avatar:left())
    peer_3_avatar:set_top(peer_2_avatar:bottom() + padding)

    local peer_3_points = zm_points_panel:text({
        name = "peer_3_points",
        vertical = "center",
        valign = "center",
        text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        color = tweak_data.chat_colors[3],
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font,
        visible = false
    })
    managers.hud:make_fine_text(peer_3_points)
    peer_3_points:set_left(peer_1_points:left())
    peer_3_points:set_world_center_y(peer_3_avatar:world_center_y())

    local peer_4_avatar = zm_points_panel:bitmap({
        texture = "guis/textures/pd2/none_icon",
        h = 40,
        w = 40,
        visible = false
    })
    peer_4_avatar:set_left(peer_3_avatar:left())
    peer_4_avatar:set_top(peer_3_avatar:bottom() + padding)

    local peer_4_points = zm_points_panel:text({
        name = "peer_4_points",
        vertical = "center",
        valign = "center",
        text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        color = tweak_data.chat_colors[4],
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font,
        visible = false
    })
    managers.hud:make_fine_text(peer_4_points)
    peer_4_points:set_left(peer_1_points:left())
    peer_4_points:set_world_center_y(peer_4_avatar:world_center_y())

    self._zmp_avatars = {
        [1] = peer_1_avatar,
        [2] = peer_2_avatar,
        [3] = peer_3_avatar,
        [4] = peer_4_avatar
    }

    self._zmp_points = {
        [1] = peer_1_points,
        [2] = peer_2_points,
        [3] = peer_3_points,
        [4] = peer_4_points
    }

    self._zmp_points[1]:set_text("---")
    self._zmp_points[2]:set_text("---")
    self._zmp_points[3]:set_text("---")
    self._zmp_points[4]:set_text("---")

    local peer_1_points_gained = zm_points_panel:text({
        name = "peer_1_points_gained",
        vertical = "center",
        valign = "center",
        x = -10,
        y = 5,
        text = "100000",
        visible = true,
        color = Color(1, 1, 0),
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font
    })
    managers.hud:make_fine_text(peer_1_points_gained)
    peer_1_points_gained:set_left(peer_1_avatar:right() + 60)
    peer_1_points_gained:set_world_center_y(peer_1_avatar:world_center_y())

    local peer_2_points_gained = zm_points_panel:text({
        name = "peer_2_points_gained",
        vertical = "center",
        valign = "center",
        x = -10,
        y = 5,
        text = "",
        visible = true,
        color = Color(1, 1, 0),
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font
    })
    managers.hud:make_fine_text(peer_2_points_gained)
    peer_2_points_gained:set_left(peer_2_avatar:right() + 60)
    peer_2_points_gained:set_world_center_y(peer_2_avatar:world_center_y())

    local peer_3_points_gained = zm_points_panel:text({
        name = "peer_3_points_gained",
        vertical = "center",
        valign = "center",
        x = -10,
        y = 5,
        text = "",
        visible = true,
        color = Color(1, 1, 0),
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font
    })
    managers.hud:make_fine_text(peer_3_points_gained)
    peer_3_points_gained:set_left(peer_3_avatar:right() + 60)
    peer_3_points_gained:set_world_center_y(peer_3_avatar:world_center_y())

    local peer_4_points_gained = zm_points_panel:text({
        name = "peer_4_points_gained",
        vertical = "center",
        valign = "center",
        x = -10,
        y = 5,
        text = "",
        visible = true,
        color = Color(1, 1, 0),
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font
    })
    managers.hud:make_fine_text(peer_4_points_gained)
    peer_4_points_gained:set_left(peer_4_avatar:right() + 60)
    peer_4_points_gained:set_world_center_y(peer_4_avatar:world_center_y())

    self._zmp_points_gain = {
        [1] = peer_1_points_gained,
        [2] = peer_2_points_gained,
        [3] = peer_3_points_gained,
        [4] = peer_4_points_gained
    }

    for i = 1, 4 do
        self._zmp_points_gain[i]:set_text("")
    end

    self._zmp_points_initial_ixes = {
        [1] = peer_1_points_gained:x(),
        [2] = peer_2_points_gained:x(),
        [3] = peer_3_points_gained:x(),
        [4] = peer_4_points_gained:x()
    }

    self._zmp_points_initial_whys = {
        [1] = peer_1_points_gained:y(),
        [2] = peer_2_points_gained:y(),
        [3] = peer_3_points_gained:y(),
        [4] = peer_4_points_gained:y()
    }

    local peer_1_points_gained_dupe_1 = self:GenerateDuplicates(zm_points_panel, 1, 1)
    local peer_1_points_gained_dupe_2 = self:GenerateDuplicates(zm_points_panel, 1, 2)
    local peer_1_points_gained_dupe_3 = self:GenerateDuplicates(zm_points_panel, 1, 3)
    local peer_1_points_gained_dupe_4 = self:GenerateDuplicates(zm_points_panel, 1, 4)
    local peer_1_points_gained_dupe_5 = self:GenerateDuplicates(zm_points_panel, 1, 5)
    local peer_1_points_gained_dupe_6 = self:GenerateDuplicates(zm_points_panel, 1, 6)
    local peer_1_points_gained_dupe_7 = self:GenerateDuplicates(zm_points_panel, 1, 7)
    local peer_1_points_gained_dupe_8 = self:GenerateDuplicates(zm_points_panel, 1, 8)
    local peer_1_points_gained_dupe_9 = self:GenerateDuplicates(zm_points_panel, 1, 9)
    local peer_1_points_gained_dupe_10 = self:GenerateDuplicates(zm_points_panel, 1, 10)
    local peer_2_points_gained_dupe_1 = self:GenerateDuplicates(zm_points_panel, 2, 1)
    local peer_2_points_gained_dupe_2 = self:GenerateDuplicates(zm_points_panel, 2, 2)
    local peer_2_points_gained_dupe_3 = self:GenerateDuplicates(zm_points_panel, 2, 3)
    local peer_2_points_gained_dupe_4 = self:GenerateDuplicates(zm_points_panel, 2, 4)
    local peer_2_points_gained_dupe_5 = self:GenerateDuplicates(zm_points_panel, 2, 5)
    local peer_2_points_gained_dupe_6 = self:GenerateDuplicates(zm_points_panel, 2, 6)
    local peer_2_points_gained_dupe_7 = self:GenerateDuplicates(zm_points_panel, 2, 7)
    local peer_2_points_gained_dupe_8 = self:GenerateDuplicates(zm_points_panel, 2, 8)
    local peer_2_points_gained_dupe_9 = self:GenerateDuplicates(zm_points_panel, 2, 9)
    local peer_2_points_gained_dupe_10 = self:GenerateDuplicates(zm_points_panel, 2, 10)
    local peer_3_points_gained_dupe_1 = self:GenerateDuplicates(zm_points_panel, 3, 1)
    local peer_3_points_gained_dupe_2 = self:GenerateDuplicates(zm_points_panel, 3, 2)
    local peer_3_points_gained_dupe_3 = self:GenerateDuplicates(zm_points_panel, 3, 3)
    local peer_3_points_gained_dupe_4 = self:GenerateDuplicates(zm_points_panel, 3, 4)
    local peer_3_points_gained_dupe_5 = self:GenerateDuplicates(zm_points_panel, 3, 5)
    local peer_3_points_gained_dupe_6 = self:GenerateDuplicates(zm_points_panel, 3, 6)
    local peer_3_points_gained_dupe_7 = self:GenerateDuplicates(zm_points_panel, 3, 7)
    local peer_3_points_gained_dupe_8 = self:GenerateDuplicates(zm_points_panel, 3, 8)
    local peer_3_points_gained_dupe_9 = self:GenerateDuplicates(zm_points_panel, 3, 9)
    local peer_3_points_gained_dupe_10 = self:GenerateDuplicates(zm_points_panel, 3, 10)
    local peer_4_points_gained_dupe_1 = self:GenerateDuplicates(zm_points_panel, 4, 1)
    local peer_4_points_gained_dupe_2 = self:GenerateDuplicates(zm_points_panel, 4, 2)
    local peer_4_points_gained_dupe_3 = self:GenerateDuplicates(zm_points_panel, 4, 3)
    local peer_4_points_gained_dupe_4 = self:GenerateDuplicates(zm_points_panel, 4, 4)
    local peer_4_points_gained_dupe_5 = self:GenerateDuplicates(zm_points_panel, 4, 5)
    local peer_4_points_gained_dupe_6 = self:GenerateDuplicates(zm_points_panel, 4, 6)
    local peer_4_points_gained_dupe_7 = self:GenerateDuplicates(zm_points_panel, 4, 7)
    local peer_4_points_gained_dupe_8 = self:GenerateDuplicates(zm_points_panel, 4, 8)
    local peer_4_points_gained_dupe_9 = self:GenerateDuplicates(zm_points_panel, 4, 9)
    local peer_4_points_gained_dupe_10 = self:GenerateDuplicates(zm_points_panel, 4, 10)

    self._zmp_points_gain_dupes = {
        [1] = {
            [1] = peer_1_points_gained_dupe_1,
            [2] = peer_1_points_gained_dupe_2,
            [3] = peer_1_points_gained_dupe_3,
            [4] = peer_1_points_gained_dupe_4,
            [5] = peer_1_points_gained_dupe_5,
            [6] = peer_1_points_gained_dupe_6,
            [7] = peer_1_points_gained_dupe_7,
            [8] = peer_1_points_gained_dupe_8,
            [9] = peer_1_points_gained_dupe_9,
            [10] = peer_1_points_gained_dupe_10
        },
        [2] = {
            [1] = peer_2_points_gained_dupe_1,
            [2] = peer_2_points_gained_dupe_2,
            [3] = peer_2_points_gained_dupe_3,
            [4] = peer_2_points_gained_dupe_4,
            [5] = peer_2_points_gained_dupe_5,
            [6] = peer_2_points_gained_dupe_6,
            [7] = peer_2_points_gained_dupe_7,
            [8] = peer_2_points_gained_dupe_8,
            [9] = peer_2_points_gained_dupe_9,
            [10] = peer_2_points_gained_dupe_10
        },
        [3] = {
            [1] = peer_3_points_gained_dupe_1,
            [2] = peer_3_points_gained_dupe_2,
            [3] = peer_3_points_gained_dupe_3,
            [4] = peer_3_points_gained_dupe_4,
            [5] = peer_3_points_gained_dupe_5,
            [6] = peer_3_points_gained_dupe_6,
            [7] = peer_3_points_gained_dupe_7,
            [8] = peer_3_points_gained_dupe_8,
            [9] = peer_3_points_gained_dupe_9,
            [10] = peer_3_points_gained_dupe_10
        },
        [4] = {
            [1] = peer_4_points_gained_dupe_1,
            [2] = peer_4_points_gained_dupe_2,
            [3] = peer_4_points_gained_dupe_3,
            [4] = peer_4_points_gained_dupe_4,
            [5] = peer_4_points_gained_dupe_5,
            [6] = peer_4_points_gained_dupe_6,
            [7] = peer_4_points_gained_dupe_7,
            [8] = peer_4_points_gained_dupe_8,
            [9] = peer_4_points_gained_dupe_9,
            [10] = peer_4_points_gained_dupe_10
        }
    }

    self._zmp_points_gain_dupes_status = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0
    }
end

function HUDZMPoints:GenerateDuplicates(parent_panel, player_id, proper_id)
    local params = {
        name = "peer_" .. player_id .. "_points_gained_dupe_" .. proper_id,
        vertical = "center",
        valign = "center",
        x = -10,
        y = 5,
        text = "+99999",
        visible = true,
        color = Color(1, 1, 0),
        font_size = tweak_data.menu.pd2_small_font_size,
        font = tweak_data.menu.pd2_large_font
    }

    local dupe_text = parent_panel:text(params)

    managers.hud:make_fine_text(dupe_text)
    dupe_text:set_left(self._zmp_avatars[player_id]:right() + 60)
    dupe_text:set_world_center_y(self._zmp_avatars[player_id]:world_center_y())
    dupe_text:set_text("")

    return dupe_text
end

function HUDZMPoints:_animate_points_gained_v2(id, gain, is_positive)
    local text = "+0"
    local sign = is_positive and "+" or ""

    if gain then
        text = sign .. gain
    end

    local text_panel_to_use = self._zmp_points_gain[id]

    if self._zmp_points_gain_dupes_status[id] > 0 then
        text_panel_to_use = self._zmp_points_gain_dupes[id][self._zmp_points_gain_dupes_status[id]]
    end

    text_panel_to_use:set_text(text)

    if not is_positive then
        text_panel_to_use:set_color(Color(1, 1, 0, 0))
    else
        text_panel_to_use:set_color(Color(1, 1, 1, 0))
    end

    local initial_x = self._zmp_points_initial_ixes[id]
    local initial_y = self._zmp_points_initial_whys[id]

    local function anim_test(o)
        o:stop()
        local color_from = text_panel_to_use:color()
        local color_to = text_panel_to_use:color():with_alpha(0)
        local from = initial_x
        local to = initial_x + math.random(40, 75)
        local from_y = initial_y
        local to_y = initial_y + math.random(-20, 20)
        local t = 0

        while t < 1 do
            local dt = coroutine.yield()
            t = t + dt

            o:set_x(from * (1 - t) + to * t)
            o:set_y(from_y * (1 - t) + to_y * t)
            o:set_color(color_from * (1 - t) + color_to * t)
        end
	end

    text_panel_to_use:animate(anim_test)
    text_panel_to_use:set_x(initial_x)
    text_panel_to_use:set_y(initial_y)

    if self._zmp_points_gain_dupes_status[id] >= 10 then
        self._zmp_points_gain_dupes_status[id] = 0
    else
        self._zmp_points_gain_dupes_status[id] = self._zmp_points_gain_dupes_status[id] + 1
    end
end

local HUDManager_setup_player_info_hud_pd2_original = HUDManager._setup_player_info_hud_pd2

function HUDManager:_setup_player_info_hud_pd2(...)
    self:_setup_zm_element()
    HUDManager_setup_player_info_hud_pd2_original(self, ...)
end

function HUDManager:_setup_zm_element()
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
    self._hud_zm_waves = HUDZMWaves:new(hud.panel)
	self._hud_zm_points = HUDZMPoints:new(hud.panel)
end
