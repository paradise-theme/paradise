.DEFAULT_GOAL := h

# Sets value for theme, defaut set as dark. Values: dark | light
THEME ?= dark

help:
	@printf "Usage:\n\tmake THEME='dark | light' install-all (Installs theme)\n\tmake help (Shows help)\n"

install-all: alacritty dunst kitty zathura

alacritty:
	cp -r ${THEME}/alacritty ${HOME}/.config/.
	echo "import:" >> ${HOME}/.config/alacritty/alacritty.yml
	echo "  - ~/.config/alacritty/paradise.yml" >> ${HOME}/.config/alacritty/alacritty.yml
	@printf "[*] ${THEME} theme installed for alacritty.\n"

dunst:
	cp -r ${THEME}/dunst ${HOME}/.config/.
	@printf "[*] ${THEME} theme installed for dunst.\n"

kitty:
	cp -r ${THEME}/kitty ${HOME}/.config/.
	echo "include paradise.conf" >> ${HOME}/.config/kitty/kitty.conf
	@printf "[*] ${THEME} theme installed for kitty.\n"

zathura:
	cp -r ${THEME}/zathura ${HOME}/.config/.
	@printf "[*] ${THEME} theme installed for zathura.\n"
