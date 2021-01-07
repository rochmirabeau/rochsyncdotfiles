-- Imports.
 import XMonad
 import XMonad.Hooks.DynamicLog
 import XMonad.Hooks.EwmhDesktops
 import XMonad.Layout.Spacing
 import XMonad.Layout.Spiral
 import XMonad.Layout.Grid
 import XMonad.Layout.Accordion
 import XMonad.Layout.Tabbed
 import XMonad.Layout.SimpleDecoration (shrinkText)
 import XMonad.Layout.SubLayouts
 import XMonad.Layout.WindowNavigation
 import XMonad.Layout.BoringWindows
 import XMonad.Layout.NoBorders
 import XMonad.Layout.ResizableTile
 import XMonad.Layout.SimplestFloat
 import XMonad.Layout.Simplest
 import XMonad.Actions.CycleWS
 import XMonad.Util.EZConfig
 import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
 import XMonad.Hooks.FadeInactive
 import qualified XMonad.StackSet as W

 -- The main function.
 main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

 -- Command to launch the bar.
 myBar = "xmobar"

 -- Custom PP, configure it as you like. It determines what is being written to the bar.
 myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

 -- Key binding to toggle the gap for the bar.
 toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

    -- Layouts
 myLayout = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True $
        layoutTall  ||| layoutFull ||| layoutTabbed ||| layoutMirror ||| layoutGrid ||| layoutAccordion where
        layoutTall = windowNavigation $ addTabs shrinkText myTabConfig $ boringWindows $ subLayout [] (smartBorders Simplest) $ ResizableTall 1 (3/100) (1/2) []
        layoutFull = Full
        layoutTabbed = tabbed shrinkText myTabConfig
        layoutSpiral = spiral (125 / 146)
        layoutGrid = Grid
        layoutMirror = Mirror (Tall 1 (3/100) (3/5))
        layoutAccordion = Accordion

 myTabConfig = def { activeColor = "#556064"
                  , inactiveColor = "#2F3D44"
                  , urgentColor = "#FDF6E3"
                  , activeBorderColor = "#454948"
                  , inactiveBorderColor = "#454948"
                  , urgentBorderColor = "#268BD2"
                  , activeTextColor = "#80FFF9"
                  , inactiveTextColor = "#1ABC9C"
                  , urgentTextColor = "#1ABC9C"
                  , fontName = "xft:Source Code Variable Light:size=6:antialias=true"

}
 -- Keys 

 -- Main configuration, override the defaults to your liking.
 myConfig = def { 
        modMask = mod4Mask 
        , startupHook = ewmhDesktopsStartup
        , terminal = "xterm"
        , borderWidth = 3
        , focusedBorderColor = "purple"
        , handleEventHook = ewmhDesktopsEventHook
        , logHook = ewmhDesktopsLogHook >> workspaceHistoryHook >> fadeInactiveLogHook 0.7
        -- Tabbed stuff
        , layoutHook = myLayout
    } `additionalKeysP`
      [   (("M-z"), toggleWS)
        , (("M-S-z"), shiftToPrev)
        , (("M-f"), moveTo Next EmptyWS)
        , (("M-S-f"), shiftTo Next EmptyWS)
        , (("M-C-h"), sendMessage $ pullGroup L)
        , (("M-C-l"), sendMessage $ pullGroup R)
        , (("M-C-k"), sendMessage $ pullGroup U)
        , (("M-C-j"), sendMessage $ pullGroup D)
        , (("M-C-m"), withFocused (sendMessage . MergeAll))
        , (("M-C-u"), withFocused (sendMessage . UnMerge))
        , (("M-C-/"), withFocused (sendMessage . UnMergeAll))
        , (("M-C-."), onGroup W.focusUp')    -- Switch focus to next tab
        , (("M-C-,"), onGroup W.focusDown')  -- Switch focus to prev tab

      ]
