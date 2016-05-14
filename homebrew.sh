#!/bin/bash

# Install Homebrew
echo "Installing Homebrew... "
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && printf " Done.\n"

# do brew update
echo "Updating Homebrew... "
brew update && printf " Done.\n"

# Check that `brew list` works, if so then install formulae listed in ./brewlist
brew list
if [ $? -ne 0 ]; then
	echo "Brew problem, exiting."
	exit
else
	if [ $(cat brewlist | wc -l) -gt 0 ]; then
		echo "Installing formulae from brewlist: "
		for app in $(cat brewlist); do
			echo "   - Installing $app ... "
			brew install $app && printf " Done.\n"
		done
		echo "Finished installing Homebrew formulae."
	else
		echo "Brewlist is empty."
	fi
fi

# install cask
echo "\nInstalling homebrew cask... "
brew tap caskroom/cask
brew install caskroom/cask/brew-cask && printf " Done.\n"

# Check that `brew cask` works, if so then install casks listed in ./casklist
brew cask
if [ $? -ne 0 ]; then
	echo "Cask problem, exiting!\n"
	exit
else
	if [ $(cat casklist | wc -l) -gt 0 ]; then
		echo "Installing casks from casklist: "
		for cask in $(cat casklist); do
			echo "   - Installing $cask ... "
			brew cask install $app && printf " Done.\n"
		done
		echo "Finished installing Homebrew casks."
	else
		echo "Casklist is empty."
	fi
fi
echo "\nhomebrew.sh finished."
