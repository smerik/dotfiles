vicious = require("vicious")
require("blingbling")

-- Create a systray
systray = widget({ type = "systray" })

--
cpulabel = widget({ type = "textbox" })
cpulabel.text = 'cpu '
--
cpugraph = blingbling.classical_graph.new()
cpugraph:set_height(18)
cpugraph:set_width(360)
cpugraph:set_tiles_color("#00000022")
cpugraph:set_show_text(true)
cpugraph:set_label("load: $percent %")
vicious.register(cpugraph, vicious.widgets.cpu, '$1', 2)
--
corelabel = widget({ type = "textbox" })
corelabel.text = 'core '
--
core = blingbling.progress_graph.new()
core:set_height(18)
core:set_width(6)
core:set_filled(true)
core:set_h_margin(1)
core:set_filled_color("#00000033")
vicious.register(core, vicious.widgets.cpu, "$2")
--
memlabel = widget({ type = "textbox" })
memlabel.text='mem '
--
memgraph = blingbling.classical_graph.new()
memgraph:set_height(18)
memgraph:set_width(200)
memgraph:set_tiles_color("#00000022")
memgraph:set_show_text(true)
vicious.register(memgraph, vicious.widgets.mem, '$1', 2)
--
mpdlabel= widget({ type = "textbox" })
mpdlabel.text='mpd '
--
mpdvolume = blingbling.volume.new()
mpdvolume:set_height(18)
mpdvolume:set_width(30)
--bind the volume graph on mpd
mpdvolume:update_mpd()
--use bar, default is a triangle
mpdvolume:set_bar(true)

mpdgraph = blingbling.mpd_visualizer.new()
mpdgraph:set_height(18)
mpdgraph:set_width(350)
mpdgraph:update()
-- Display PCM graph with a line
mpdgraph:set_line(true)
mpdgraph:set_h_margin(4)
-- Bind mpc commands on the widget
--mpdgraph:set_mpc_commands()
-- Show the artist name and the current song
mpdgraph:set_show_text(true)
mpdgraph:set_label("$artist > $title")
--
volume = blingbling.volume.new()
volume:set_height(18)
volume:set_width(30)
---- Bind the volume widget on the master channel
volume:update_master()
volume:set_master_control()
volume:set_bar(true)
--
netlabel = widget({ type = "textbox", name = "netwidget" })
netlabel.text='net '
--
netview = blingbling.net.new()
netview:set_height(18)
-- Activate popup with IP informations on the net widget
netview:set_ippopup()
netview:set_show_text(true)
netview:set_v_margin(3)

-- Create a textclock widget
textclock = awful.widget.textclock({ align = "right" })
