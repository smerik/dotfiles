-- START awesome menu
myawesomemenu = {
  { "manual"     , terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart"    , awesome.restart },
  { "quit"       , awesome.quit }
}
-- END awesome menu


-- START development menu
mydevelopmentmenu = {
  { "Eclipse" , "" },
  { "NetBeans", "" },
  { "Vim"     , "" }
}
-- END development menu


-- START game menu
myadventuremenu = {
}

myarcademenu = {
  { "Bub-n-Bros"     , "" },
  { "BurgerSpace"    , "" }
}

myplatformmenu = {
  { "Pingus"         , "" },
  { "Princed"        , "" }
}

myroleplayingmenu = {
}

myshootermenu = {
  { "BZFlag"         , "" }
}

mysimulationmenu = {
  { "CorsixTH"      , "" },
  { "FlightGear"    , "" },
  { "Lincity"       , "" },
  { "Lincity-NG"    , "" },
  { "Micropolis"    , "" },
  { "OpenCity"      , "" },
  { "OpenSkyscraper", "" },
  { "OpenTTD"       , "" },
  { "Simutrans"     , "" }
}

mysolitairemenu = {
  { "freecell..", "" },
  { "mahjong.." , "" }
}

mysportsmenu = {
}

mystrategymenu = {
  { "0 A.D."          , "" },
  { "Freeciv"         , "" },
  { "OpenRA"          , "" },
  { "Stargus"         , "" },
  { "Unknown Horizons", "" },
  { "War1gus"         , "" },
  { "Wargus"          , "" }
}

mygamemenu = {
  { "adventure"   , myadventuremenu },
  { "arcade"      , myarcademenu },
  { "platform"    , myplatformmenu },
  { "role-playing", myroleplayingmenu },
  { "shooter"     , myshootermenu },
  { "simulation"  , mysimulationmenu },
  { "solitaire"   , mysolitairemenu },
  { "sports"      , mysportsmenu },
  { "strategy"    , mystrategymenu }
}
-- END game menu


-- START internet menu
mybrowsermenu = {
  { "Chromium", "chromium" },
  { "Firefox" , "firefox" },
  { "Opera"   , "opera" }
}

mysocialmenu = {
  { "chat"   , "" },
  { "irc"    , "" },
  { "mail"   , "mutt" },
  { "twitter", ""}
}

myinternetmenu = {
  { "browser", mybrowsermenu },
  { "social" , mysocialmenu }
}
-- END internet menu


-- START media menu
myaudiomenu = {
  { "Audacity", "" },
  { "ncmpc++" , "" }
}

myimagemenu = {
  { "GIMP", "" }
}

myvideomenu = {
  { "", "" }
}

mymediamenu = {
  { "audio", myaudiomenu },
  { "image", myimagemenu },
  { "video", myvideomenu }
}
-- END media menu


-- START office menu
myofficemenu = {
  { "Base"   , "libreoffice --base"    },
  { "Calc"   , "libreoffice --calc"    },
  { "Draw"   , "libreoffice --draw"    },
  { "Impress", "libreoffice --impress" },
  { "Math"   , "libreoffice --math"    },
  { "Writer" , "libreoffice --writer"  }
}
-- END office menu


-- START util menu
local filename = "%Y%m%d_%H%M%S-$wx$h.png"
local movetoscreenshotsdir = "'mv $f ~/screenshots'"
myscreenshotmenu = {
  { "5 s delay", "scrot -e " .. movetoscreenshotsdir .. " -d 5 " .. filename },
  { "frame"    , "scrot -e " .. movetoscreenshotsdir .. " -s "   .. filename },
  { "desktop"  , "scrot -e " .. movetoscreenshotsdir .. " "      .. filename }
}

myutilmenu = {
  { "screenshot", myscreenshotmenu }
}
-- END util menu


-- START system menu
mymachinemenu = {
  { "reboot"  , "" },
  { "shutdown", "" },
  { "stand by", "" },
  { "suspend" , "" }
}

mysystemmenu = {
  { "machine"    , mymachinemenu },
  { "lock screen", "" },
  { "update"     , "" }
}
-- END system menu


-- Now let's combine all pieces together
mymainmenu = awful.menu(
  {
    items = {
      { "awesome"      , myawesomemenu, beautiful.awesome_icon },
      { "development"  , mydevelopmentmenu },
      { "game"         , mygamemenu },
      { "internet"     , myinternetmenu },
      { "media"        , mymediamenu },
      { "office"       , myofficemenu },
      { "system"       , mysystemmenu },
      { "util"         , myutilmenu },
      { "open terminal", terminal }
    }
  }
)

mylauncher = awful.widget.launcher(
  {
    image = image(beautiful.awesome_icon),
    menu = mymainmenu
  }
)
