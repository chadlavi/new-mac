#!/bin/bash

read -p "Have you set up Dropbox yet? It must be set uo before executing this script. (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	# paths to dotfiles in Dropbox
	BASH_DOTPATH="$HOME/Dropbox/bash"
	ZSH_DOTPATH="$HOME/Dropbox/ohmyzsh"

	# Install OhMyZsh
	echo "Installing OhMyZsh... "
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && printf " Done.\n"

	# Symlink bashrc files from Dropbox
	declare -a bash_dotfiles=("bashrc" "bash_aliases" "bash_functions" "bash_profile")
	echo "Symlinking bash dotfiles from Dropbox: "
	for NAME in "${bash_dotfiles[@]}"; do
		echo "   - Linking $NAME ... "
		link -s $BASH_DOTPATH/$NAME.txt ~/.$NAME && printf " Done.\n"
	done
	echo "Finished symlinking bash dotfiles."

	# Symlink zshrc files from Dropbox
	declare -a zsh_dotfiles=("zshrc" "zsh_aliases" "zsh_functions")
	echo "\nSymlinking zsh dotfiles from Dropbox: "
	for NAME in "${zsh_dotfiles[@]}"; do
		echo "   - Linking $NAME ... "
		link -s $ZSH_DOTPATH/$NAME ~/.$NAME && printf " Done.\n"
	done
	echo "Finished symlinking zsh dotfiles."
	echo "\nohmyzsh.sh finished."
else
	echo "Exiting OhMyZsh setup. Re-run ohmyzsh.sh after setting up Dropbox."
fi

