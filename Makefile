.DEFAULT_GOAL := h

h:
	@printf "Usage: make [l|d|h]\n\tl:\tlight theme\n\td:\tdark theme\n\th:\thelp\n"

l:
	cp -r light/alacritty ${HOME}/.config/.
	echo "import:" >> ${HOME}/.config/alacritty/alacritty.yml
	echo "  - ~/.config/alacritty/paradise.yml" >> ${HOME}/.config/alacritty/alacritty.yml
	cp -r light/dunst ${HOME}/.config/.
	cp -r light/kitty ${HOME}/.config/.
	echo "include paradise.conf" >> ${HOME}/.config/kitty/kitty.conf
	cp -r light/zathura ${HOME}/.config/.
	@printf "[*] Light Theme Installed.\n"

d:
	cp -r dark/alacritty ${HOME}/.config/.
	echo "import:" >> ${HOME}/.config/alacritty/alacritty.yml
	echo "  - ~/.config/alacritty/paradise.yml" >> ${HOME}/.config/alacritty/alacritty.yml
	cp -r dark/dunst ${HOME}/.config/.
	cp -r dark/kitty ${HOME}/.config/.
	echo "include paradise.conf" >> ${HOME}/.config/kitty/kitty.conf
	cp -r dark/zathura ${HOME}/.config/.
	@printf "[*] Dark Theme Installed.\n"
