#!/bin/bash
clear
echo "WARNING: this setup script will make changes to this mac.

"
read -p "Are you sure you want to continue? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Ok. We'll start with the tweaks."
	bash tweaks.sh
	echo "Now we'll install Homebrew."
	bash homebrew.sh
	echo "Now we'll install OhMyZsh."
	bash ohmyzsh.sh
	echo "All done! Exiting."
else
	echo "Ok then! Exiting."
fi
