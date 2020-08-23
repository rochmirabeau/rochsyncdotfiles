import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Actions.Launcher
import Graphics.X11.Xlib
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.Accordion
import XMonad.Prompt
import XMonad.Prompt(def)
import XMonad.Prompt.Man
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import System.IO


main = xmonad =<< statusBar myBar myPP toggleStrutKey myConfig

myBar = "/usr/bin/xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "purple" "" . wrap "{" "}" }


toggleStrutKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myPrompt = defaultXPConfig {
	fgColor = "purple"
	, bgColor = "black"
	, font = "xft:JetBrains Mono:size=14"
	, height = 36
}

myConfig = defaultConfig { 
         modMask = mod4Mask
         , startupHook = ewmhDesktopsStartup
         , terminal = "xfce4-terminal"
         , focusedBorderColor = "purple"
         , manageHook = manageDocks <+> manageHook defaultConfig
         , layoutHook = smartSpacing 3 $ layoutHook defaultConfig
         , borderWidth = 2
         , handleEventHook = ewmhDesktopsEventHook
         , logHook = ewmhDesktopsLogHook
       	}
                `additionalKeys`
			[  ((mod4Mask, xK_p), spawn "rofi -show run ")
		        ,  ((mod4Mask, xK_c), spawn "rofi -show calc ")
		        ,  ((mod4Mask, xK_s), spawn "rofi -show emoji ")
		        ,  ((mod4Mask, xK_a), spawn "rofi -show window ")
		        ,  ((mod4Mask, xK_d), spawn "xfce4-dict")
		        ,  ((mod4Mask, xK_g), spawn "xfce4-terminal -e vim")
		        ,  ((mod4Mask, xK_x), spawn "xkill")
                ]
                `additionalKeysP`        
                [ ("C-S-<Escape>", spawn "xfce4-terminal -e htop")
                , ("M-S-d", spawn "speedreader")
                , ("M-S-g", spawn "gvim")
                , ("M-o", shellPrompt myPrompt)
                ]
  
