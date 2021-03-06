--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz
     status: modefied

--]]

local gears = require("gears");
local lain  = require("lain");
local awful = require("awful");
local wibox = require("wibox");
local beautiful = require("beautiful");

local os = { getenv = os.getenv };
local my_table = awful.util.table or gears.table; -- 4.{0,1} compatibility

local theme                                     = {};
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark";
theme.wallpaper                                 = theme.dir .. "/wall.png";
--theme.font                                      = "Font Awesome 5 Free 12";
theme.font                                      = "Source Han Sans Normal 12";
theme.fg_normal                                 = "#000000";
theme.fg_focus                                  = "#ff0000";
theme.fg_urgent                                 = "#CC9393";
theme.bg_normal                                 = "#1A1A1A";
theme.bg_focus                                  = "#313131";
theme.bg_urgent                                 = "#1A1A1A";
theme.border_width                              = 2;
theme.border_normal                             = "#3F3F3F";
theme.border_focus                              = "#ff0000";
theme.border_marked                             = "#CC9393";
theme.tasklist_bg_normal                        = "#ffffff00";
theme.tasklist_bg_focus                         = "#ffffff00";
theme.bg_systray                                = "#5C3F3F";
theme.titlebar_bg_focus                         = theme.bg_focus;
theme.titlebar_bg_normal                        = theme.bg_normal;
theme.titlebar_fg_focus                         = theme.fg_focus;
theme.menu_height                               = auto;
theme.menu_width                                = auto;
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png";
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png";
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png";
theme.layout_tile                               = theme.dir .. "/icons/tile.png";
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png";
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png";
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png";
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png";
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png";
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png";
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png";
theme.layout_max                                = theme.dir .. "/icons/max.png";
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png";
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png";
theme.layout_floating                           = theme.dir .. "/icons/floating.png";
theme.widget_ac                                 = theme.dir .. "/icons/battery_full.png";
theme.widget_battery                            = theme.dir .. "/icons/battery_full.png";
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png";
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png";
theme.widget_mem                                = theme.dir .. "/icons/mem.png";
theme.widget_cpu                                = theme.dir .. "/icons/cpu_new.png";
theme.widget_temp                               = theme.dir .. "/icons/alert.png";
theme.widget_net                                = theme.dir .. "/icons/wifi.png";
theme.widget_net_down                           = theme.dir .. "/icons/arrow_downward.png";
theme.widget_net_up                             = theme.dir .. "/icons/arrow_upward.png";
theme.widget_hdd                                = theme.dir .. "/icons/storage.png";
theme.widget_music                              = theme.dir .. "/icons/music.png";
theme.widget_music_on                           = theme.dir .. "/icons/music.png";
theme.widget_vol                                = theme.dir .. "/icons/vol.png";
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png";
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png";
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png";
theme.widget_mail                               = theme.dir .. "/icons/mail.png";
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png";
theme.calendar                                  = theme.dir .. "/icons/calendar.png";
theme.tasklist_plain_task_name                  = true;
theme.tasklist_disable_icon                     = true;
theme.useless_gap                               = 5;
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png";
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png";
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png";
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png";
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png";
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png";
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png";
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png";
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png";
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png";
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png";
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png";
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png";
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png";
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png";
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png";
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png";
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png";

local markup = lain.util.markup;
local separators = lain.util.separators;

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock);
local clock = awful.widget.watch(
    "date +'%Y-%m-%d %T'", 01,
    function(widget, stdout)
        --widget:set_markup(" " .. markup.font(theme.font, stdout))
        widget:set_markup(" " .. markup.font(theme.font, markup("#000000", stdout)))
    end
)

-- Calendar
local calendaricon = wibox.widget.imagebox(theme.calendar)
theme.cal = lain.widget.calendar({
    attach_to = { clock },
    notification_preset = {
        font = "Monaco 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal .. "80"
    }
})



-- Mail IMAP check
local mailicon = wibox.widget.imagebox(theme.widget_mail)
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
local mail = lain.widget.imap({
    timeout  = 180,
    server   = "imap.gmail.com",
    mail     = "youremail@gmail.com",
    password = "yourpassword",
    settings = function()
        if mailcount > 0 then
            widget:set_markup(" " .. markup.font(theme.font, markup("#FF0000", mailcount)))
            mailicon:set_image(theme.widget_mail)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        awful.spawn.with_shell("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        awful.spawn.with_shell("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        awful.spawn.with_shell("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#12C2ED", artist .. " " .. title)))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup("#48D1CC", " " .. mem_now.used .. "MB ")))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup("#48D1CC", " " .. cpu_now.usage .. "% ")))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup("#48D1CC", " " .. coretemp_now .. "°C ")))
    end
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal .. "80", font = "Monaco 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, markup("#000000", " " .. fs_now["/"].percentage .. "% ")))
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, markup("#000000", "AC  ")))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, markup("#000000", bat_now.perc .. "% ")))
        else
            widget:set_markup(markup.font(theme.font, markup("#000000", "AC  ")))
            baticon:set_image(theme.widget_ac)
        end
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end
        widget:set_markup(markup.font(theme.font, markup("#000000", " "..volume_now.level .. "% ")))
    end
})

-- Netl 网速
local neticon = wibox.widget.imagebox(theme.widget_net)
local neticon_down = wibox.widget.imagebox(theme.widget_net_down)
local neticon_up = wibox.widget.imagebox(theme.widget_net_up)
local net_down = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup("#000000", net_now.received .. "kb/s")))
    end
})
local net_up = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup("#000000", net_now.sent .. "kb/s ")))
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)


-- 创建一个小部件按钮
  button.buttons = {
	  awful.button({}, 1, nil, function()
		  print("我创建了一个按钮")
	  end)
  }
paddings = {
	top = 2, bottom = 2,
	left = 2,
	right = 2,
}

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top",opacity = 1, screen = s, height = 40, bg = theme.bg_normal .. "00", fg = theme.fg_normal })

    -- Create a tasklist
    s.mysystray = wibox.widget.systray()
    s.mysystray.opacity = 1;


    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            s.mysystray,
            spr,
			-- 一个音乐控件，没有实装
            --spr,
            --wibox.container.background(mpdicon),
            --wibox.container.background(theme.mpd.widget),
			-- 音量
            spr,
            volicon,
			-- 邮件
            theme.volume.widget,
			-- 邮件
            --wibox.container.background(mailicon),
            --wibox.container.background(mail.widget),
            --spr,
            --spr,
            --memicon,
            --mem.widget,
            --spr,
            --wibox.container.background(cpuicon),
            --wibox.container.background(cpu.widget),
			-- CPU 温度
            --spr,
            --tempicon,
            --temp.widget,
			-- 存储空间
            spr,
            wibox.container.background(fsicon),
            wibox.container.background(theme.fs.widget),
			-- 电池图标
            baticon,
            bat.widget,
			-- 网速
            wibox.container.background(neticon_down),
            wibox.container.background(net_down.widget),
            wibox.container.background(neticon_up),
            wibox.container.background(net_up.widget),
            --calendaricon,
            clock, -- 显示时间
            spr,
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }
end

return theme
