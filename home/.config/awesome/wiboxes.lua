require("widgets")

-- Create a wibox for each screen and add it
wibox = {}
promptbox = {}
layoutbox = {}
taglist = {}
taglist.buttons = awful.util.table.join(
  awful.button({        }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({        }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({        }, 4, awful.tag.viewnext),
  awful.button({        }, 5, awful.tag.viewprev)
)
tasklist = {}
tasklist.buttons = awful.util.table.join(
  awful.button({ }, 1,
    function (c)
      if c == client.focus then
        c.minimized = true
      else
        if not c:isvisible() then
          awful.tag.viewonly(c:tags()[1])
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
      end
    end
  ),
  awful.button({ }, 3,
    function ()
      if instance then
        instance:hide()
        instance = nil
      else
        instance = awful.menu.clients({ width=250 })
      end
    end
  ),
  awful.button({ }, 4,
    function ()
      awful.client.focus.byidx(1)
      if client.focus then
        client.focus:raise()
      end
    end
  ),
  awful.button({ }, 5,
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then
        client.focus:raise()
      end
    end
  )
)

for s = 1, screen.count() do
  -- Create a promptbox for each screen
  promptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  layoutbox[s] = awful.widget.layoutbox(s)
  layoutbox[s]:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
  awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
  awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
  awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end))
  )
  -- Create a taglist widget
  taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)

  -- Create a tasklist widget
  tasklist[s] = awful.widget.tasklist(function(c)
    return awful.widget.tasklist.label.currenttags(c, s)
  end, tasklist.buttons)

  -- Create the wibox
  wibox[s] = awful.wibox({ position = "top", screen = s })
  -- Add widgets to the wibox - order matters
  wibox[s].widgets = {
    {
      launcher,
      taglist[s],
      promptbox[s],
      layout = awful.widget.layout.horizontal.leftright
    },
    layoutbox[s],
    textclock,
    s == 1 and systray or nil,
    tasklist[s],
    layout = awful.widget.layout.horizontal.rightleft
  }
end
