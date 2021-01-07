#Start x at login
 if status is-login
 	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
 		exec startx
 	end
 end
 set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0

 set -gx EDITOR vim
 set -gx BROWSER brave
 set -gx TERMINAL kitty
 set -xU LESS_TERMCAP_md (printf "\e[01;31m")
 set -xU LESS_TERMCAP_me (printf "\e[0m")
 set -xU LESS_TERMCAP_se (printf "\e[0m")
 set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
 set -xU LESS_TERMCAP_ue (printf "\e[0m")
 set -xU LESS_TERMCAP_us (printf "\e[01;32m")
 source /home/rochromb/.config/fish/init.fish
