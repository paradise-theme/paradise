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

printf "${cr}[*] Old Configs Would Be Replaced In The Process${cb}\n"
for a in $(ls cfg/); do
  [ "$allow" = "yes" ] || read -p "Install Paradise for $a? [Yes|No]: " allow
  case $allow in
      Y*|y*) cp -r cfg/$a $HOME/.config/.
        printf "[+] config for $a copied\n"
      case $a in
        blender) [ -f $HOME/.config/blender/*/scripts/presets/interface_theme/. ] && mv $HOME/.config/blender/*.xml $HOME/.config/blender/*/scripts/presets/interface_theme/.;;
      esac;;
    *) printf "${cr}[-] Skipped\n";;
  esac
done
