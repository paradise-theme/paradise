# !/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

help(){
  printf "${cg}Usage: ./install.sh ${cb}[l|d|h]${cg}
    ${cb}l:${cg} light theme
    ${cb}d:${cg} dark theme\n"
}

case $1 in 
  -l*|--l*|l*) theme="light";;
  -d*|--d*|d*) theme="dark";;
  *) help && exit 1;;
esac

for a in $(ls $theme --hide powershell); do cp -rv $theme/$a $HOME/.config/.; done
printf "import:
  - ~/.config/alacritty/paradise.yml\n" >> $HOME/.config/alacritty/alacritty.yml
printf "include ~/.config/alacritty/paradise.conf\n" >> $HOME/.config/kitty/kitty.conf
printf "[*] $theme Theme Installed.\n"
