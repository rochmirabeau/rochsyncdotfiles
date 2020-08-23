-- Imports.
 import XMonad
 import XMonad.Hooks.DynamicLog
 import XMonad.Hooks.EwmhDesktops
 import XMonad.Layout.Spacing
 import XMonad.Layout.Spiral
 import XMonad.Layout.Grid
 import XMonad.Layout.Accordion
 import XMonad.Actions.CycleWS
 import XMonad.Util.EZConfig
 import XMonad.Hooks.WorkspaceHistory (workspaceHistoryHook)
 import XMonad.Hooks.FadeInactive

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
        layoutTall ||| layoutMirror ||| layoutFull ||| layoutSpiral ||| layoutGrid ||| layoutAccordion where
        layoutTall = Tall 1 (3/100) (1/2) 
	layoutFull = Full
        layoutSpiral = spiral (125 / 146)
        layoutGrid = Grid
        layoutMirror = Mirror (Tall 1 (3/100) (3/5))
        layoutAccordion = Accordion

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
        , layoutHook = myLayout
    } `additionalKeysP`
      [   (("M-z"), toggleWS)
        , (("M-S-z"), shiftToPrev)
        , (("M-f"), moveTo Next EmptyWS)
        , (("M-S-f"), shiftTo Next EmptyWS)
      ]
