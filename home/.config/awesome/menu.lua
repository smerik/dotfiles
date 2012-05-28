-- START awesome menu
awesomemenu = {
  { "manual"     , terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart"    , awesome.restart },
  { "quit"       , awesome.quit }
}
-- END awesome menu


-- START development menu
developmentmenu = {
  { "Eclipse" , "" },
  { "NetBeans", "" },
  { "Vim"     , "" }
}
-- END development menu


-- START game menu
adventuremenu = {
}

arcademenu = {
  { "Bub-n-Bros"     , "" },
  { "BurgerSpace"    , "" }
}

platformmenu = {
  { "Pingus"         , "" },
  { "Princed"        , "" }
}

roleplayingmenu = {
}

shootermenu = {
  { "BZFlag"         , "" }
}

simulationmenu = {
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

solitairemenu = {
  { "freecell..", "" },
  { "mahjong.." , "" }
}

sportsmenu = {
}

strategymenu = {
  { "0 A.D."          , "" },
  { "Freeciv"         , "" },
  { "OpenRA"          , "" },
  { "Stargus"         , "" },
  { "Unknown Horizons", "" },
  { "War1gus"         , "" },
  { "Wargus"          , "" }
}

gamemenu = {
  { "adventure"   , adventuremenu },
  { "arcade"      , arcademenu },
  { "platform"    , platformmenu },
  { "role-playing", roleplayingmenu },
  { "shooter"     , shootermenu },
  { "simulation"  , simulationmenu },
  { "solitaire"   , solitairemenu },
  { "sports"      , sportsmenu },
  { "strategy"    , strategymenu }
}
-- END game menu


-- START internet menu
browsermenu = {
  { "Chromium", "chromium" },
  { "Firefox" , "firefox" },
  { "Opera"   , "opera" }
}

socialmenu = {
  { "chat"   , "" },
  { "irc"    , "" },
  { "mail"   , "mutt" },
  { "twitter", ""}
}

internetmenu = {
  { "browser", browsermenu },
  { "social" , socialmenu }
}
-- END internet menu


-- START media menu
audiomenu = {
  { "Audacity", "" },
  { "ncmpc++" , "" }
}

imagemenu = {
  { "GIMP", "" }
}

videomenu = {
  { "", "" }
}

mediamenu = {
  { "audio", audiomenu },
  { "image", imagemenu },
  { "video", videomenu }
}
-- END media menu


-- START office menu
officemenu = {
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
screenshotmenu = {
  { "5 s delay", "scrot -e " .. movetoscreenshotsdir .. " -d 5 " .. filename },
  { "frame"    , "scrot -e " .. movetoscreenshotsdir .. " -s "   .. filename },
  { "desktop"  , "scrot -e " .. movetoscreenshotsdir .. " "      .. filename }
}

utilmenu = {
  { "screenshot", screenshotmenu }
}
-- END util menu


-- START system menu
machinemenu = {
  { "reboot"  , "" },
  { "shutdown", "" },
  { "stand by", "" },
  { "suspend" , "" }
}

systemmenu = {
  { "machine"    , machinemenu },
  { "lock screen", "" },
  { "update"     , "" }
}
-- END system menu


-- Now let's combine all pieces together
mainmenu = awful.menu(
  {
    items = {
      { "awesome"      , awesomemenu, beautiful.awesome_icon },
      { "development"  , developmentmenu },
      { "game"         , gamemenu },
      { "internet"     , internetmenu },
      { "media"        , mediamenu },
      { "office"       , officemenu },
      { "system"       , systemmenu },
      { "util"         , utilmenu },
      { "open terminal", terminal }
    }
  }
)

launcher = awful.widget.launcher(
  {
    image = image(beautiful.awesome_icon),
    menu = mainmenu
  }
)
