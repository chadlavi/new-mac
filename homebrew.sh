#!/bin/bash

echo "First, go install Xcode!"
read -n1 -r -p "Press space once to open iTunes store."
open https://itunes.apple.com/us/app/xcode/id497799835

# Install Homebrew
read -n1 -r -p "Hit any key to continue with Homebrew installation."
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
			brew cask install $cask && printf " Done.\n"
			# add iTerm to the dock when it's installed
			if [[ $cask == 'iterm2' ]]; then
				defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
				killall Dock
			fi
			# open the Dropbox app after it is installed
			if [[ $cask == 'dropbox' ]]; then
				open -a Dropbox
			fi
		done
		echo "Symlinking apps to Apps folder... "
		brew linkapps && printf " Done.\n"
		echo "Finished installing Homebrew casks."
	else
		echo "Casklist is empty."
	fi
fi
echo "\nhomebrew.sh finished."
