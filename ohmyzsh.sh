#!/bin/bash

# Install OhMyZsh
echo "Installing OhMyZsh... "
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && printf " Done.\n"

# Symlink bashrc files from Dropbox
declare -a bash_dotfiles=("bashrc" "bash_aliases" "bash_functions" "bash_profile")
echo "Symlinking bash dotfiles from Dropbox: "
for NAME in "${bash_dotfiles[@]}"; do
	echo "   - Linking $NAME ... "
	link -s ~/Dropbox/bash/$NAME.txt ~/.$NAME && printf " Done.\n"
done
echo "Finished symlinking bash dotfiles."

# Symlink zshrc files from Dropbox
declare -a zsh_dotfiles=("zshrc" "zsh_aliases" "zsh_functions")
echo "\nSymlinking zsh dotfiles from Dropbox: "
for NAME in "${zsh_dotfiles[@]}"; do
	echo "   - Linking $NAME ... "
	link -s ~/Dropbox/ohmyzsh/$NAME ~/.$NAME && printf " Done.\n"
done
echo "Finished symlinking zsh dotfiles."
echo "\nohmyzsh.sh finished."

