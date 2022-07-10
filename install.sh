#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

help(){
  printf "${cg}Usage: ./install.sh ${cb}-[l|d|a|h]${cg}
    ${cb}l:${cg} light theme
    ${cb}d:${cg} dark theme
    ${cb}a:${cg} allow all
    ${cb}h:${cg} help\n"
  exit
}

while getopts "ldah" option; do
  case $option in
    l) theme="light";;
    d) theme="dark";;
    a) allow="yes";;
    h) help;;
    *) break;;
  esac
done

if [ "$theme" = "" ]; then
  printf "${cr}[*] No theme Selected\n" && exit 1
fi
for a in $(ls $theme/cfg/); do
  printf "${cb}"
  [ "$allow" = "yes" ] || read -p "Install Paradise for $a? [Yes|No]: " allow
  case $allow in
    Y*|y*) cp -r $theme/cfg/$a $HOME/.config/.
      case $a in
        alacritty) printf "import:\n  - ~/.config/alacritty/paradise.yml\n" >> $HOME/.config/alacritty/alacritty.yml;;
        kitty) printf "include ~/.config/kitty/paradise.conf\n" >> $HOME/.config/kitty/kitty.conf;;
        zathura) printf "include paradise\n" >> $HOME/.config/zathura/zathurarc;;
        lite-xl) printf "core.reload_module(\"colors.paradise-$theme\")\n" >> $HOME/.config/lite-xl/init.lua;;
        blender) mv $HOME/.config/blender/*.xml $HOME/.config/blender/*/scripts/presets/interface_theme/.;;
      esac;;
    *) printf "${cr}[-] Skipped\n";;
  esac
done
