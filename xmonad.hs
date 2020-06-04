import Data.Ratio ((%))

import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Layout.ResizableTile
import XMonad.Layout.Simplest
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.IM
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.Maximize
import XMonad.Layout.Tabbed

import XMonad.Actions.GridSelect


main = xmonad defaultConfig

        { terminal = "hyper"
        , borderWidth = 4
        , modMask = mod4Mask 
        
        , normalBorderColor = "#808080"
        , focusedBorderColor = "#99cb81"
        
        , manageHook = myManageFloat <+> myManageShift
        , startupHook = myStartup
        , layoutHook = myLayout
        }

myLayout = avoidStruts
         $ smartBorders
         $ spacingRaw True (Border 5 5 5 5) True (Border 5 5 5 5) True
         $ all
            where
                all = ResizableTall 1 (3/100) (1/2) [] ||| Simplest ||| Full ||| Grid 

myManageFloat = composeAll
              [ className =? "VLC" --> doFloat
              , className =? "TheDesk" --> doFloat
              , className =? "Firefox"    --> doFloat
              , className =? "Nyaovim" --> doFloat
              ]

myManageShift = composeAll
              [ className =? "Nemo" --> doShift "5"
              , className =? "Firefox" --> doShift "2"
              , className =? "Tilix" --> doShift "1"
              ]

myStartup = do
           spawn "feh --bg-fill ~/Desktop/Wallpapers/thunderstorm.jpg"
