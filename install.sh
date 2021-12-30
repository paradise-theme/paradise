# !/bin/sh

# variables
cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"
help(){
  printf "${cg}Usage: ./install.sh ${cb}[l|d|h]${cg}
    ${cb}l:${cg} light theme
    ${cb}d:${cg} dark theme\n"
}
case $1 in 
  -l*|--l*|l*) theme="light"; cp -r light/* $HOME/.config/;;
  -d*|--d*|d*) theme="dark"; cp -r dark/* $HOME/.config/;;
  *) help && exit 1;;
esac
printf "${cg}[*] Theme $theme Installed.\n"
