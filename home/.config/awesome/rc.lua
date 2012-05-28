require("awful")           -- AWesome Functions very UsefuL
require("awful.autofocus") -- Makes sure there's always a client that will have focus on an event
require("awful.rules")     -- Apply rules to clients at startup
require("beautiful")       -- Theme library
require("naughty")         -- Notification library

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
require("variables")       -- Variable definitions
require("wiboxes")         -- Statusbars, titlebars, etc.
require("mouse_bindings")  -- Mouse bindings
require("keys")            -- Key bindings
require("rules")           -- Rules
require("signals")         -- Signals
