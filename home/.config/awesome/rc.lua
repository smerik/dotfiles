-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify(
    {
      preset = naughty.config.presets.critical,
      title = "Oops, there were errors during startup!",
      text = awesome.startup_errors
    }
  )
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.add_signal("debug::error",
    function (err)
      -- Make sure we don't go into an endless error loop
      if in_error then
        return
      end
      in_error = true

      naughty.notify(
        {
          preset = naughty.config.presets.critical,
          title = "Oops, an error happened!",
          text = err
        }
      )
      in_error = false
    end
  )
end
-- }}}

-- {{{ Variable definitions
require("variables")
-- }}}

-- {{{ Tags
require("tags")
-- }}}

--- {{{ Menu}
require("menu")
-- }}}

-- {{{ Wibox
require("widgets")
-- }}}

-- {{{ Mouse bindings
root.buttons(
  awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
  )
)
-- }}}

-- {{{ Key bindings
require("keys")
-- }}}

-- {{{ Rules
require("rules")
-- }}}

-- {{{ Signals
require("signals")
-- }}}
