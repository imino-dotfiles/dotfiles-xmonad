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

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

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
              [ className =? "Pavucontrol" --> doFloat
              ]

myManageShift = composeAll
              [ className =? "Nemo" --> doShift "5"
              ]

myStartup = do
           spawn "feh --bg-fill ~/dotfiles/WALLPAPER.jpg"
