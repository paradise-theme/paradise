#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

help(){
  printf "${cg}Usage: ./install.sh ${cb}-[a|h]${cg}
    ${cb}a:${cg} allow all
    ${cb}h:${cg} help\n"
  exit
}

while getopts "ah" option; do
  case $option in
    a) allow="yes";;
    h) help;;
    *) break;;
  esac
done

for a in $(ls cfg/); do
  printf "${cb}"
  [ "$allow" = "yes" ] || read -p "Install Paradise for $a? [Yes|No]: " allow
  case $allow in
      Y*|y*) cp -r cfg/$a $HOME/.config/.
      case $a in
        alacritty) printf "import:\n  - ~/.config/alacritty/paradise.yml\n" >> $HOME/.config/alacritty/alacritty.yml;;
        kitty) printf "include ~/.config/kitty/paradise.conf\n" >> $HOME/.config/kitty/kitty.conf;;
        foot) printf "[main]\ninclude=~/.config/foot/paradise.ini\n" >> $HOME/.config/foot/foot.ini;;
        zathura) printf "include paradise\n" >> $HOME/.config/zathura/zathurarc;;
        lite-xl) printf "core.reload_module(\"colors.paradise\")\n" >> $HOME/.config/lite-xl/init.lua;;
        blender) mv $HOME/.config/blender/*.xml $HOME/.config/blender/*/scripts/presets/interface_theme/.;;
      esac;;
    *) printf "${cr}[-] Skipped\n";;
  esac
done
