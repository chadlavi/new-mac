#!/bin/bash
clear
echo "WARNING: this setup script will make changes to this mac.

** set up Dropbox before you execute this setup script **
"
read -p "Are you sure you want to continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Ok. We'll start with the tweaks."
	bash tweaks.sh
	echo "Now we'll install homebrew."
	bash homebrew.sh
	echo "Now we'll install OhMyZsh."
	bash ohmyzsh.sh
else
	echo "All done! Exiting."
	exit
fi
