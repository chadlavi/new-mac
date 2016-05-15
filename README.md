# Set up a new mac
This repo is meant for personal use—there's some stuff here that will break if you try to use it unmodified on your system. Feel free, however, to clone it and modify it as you see fit. That's more of less what this is anyway, my own personalized version of many people's different setup scripts.

### Setup
First, download and unzip this repo:
```shell
curl "https://github.com/chadlavi/new-mac/archive/master.zip" -o "$HOME/Downloads/new-mac.zip" && unzip $HOME/Downloads/new-mac.zip && cd $HOME/Downloads/new-mac
```
Then, run the setup script:
```shell
setup.sh
``` 

`setup.sh` is just a wrapper to run `tweaks.sh`, `homebrew.sh`, and `ohmyzsh.sh`.

### What does it do?
##### [tweaks.sh](tweaks.sh)
Sets various system settings and preferences—this is just an edited version of [osx-for-hackers.sh](https://gist.github.com/brandonb927/3195465).

##### [homebrew.sh](homebrew.sh)
Prompts you to download [Xcode](https://itunes.apple.com/us/app/xcode/id497799835), then sets up [Homebrew](brew.sh) and installs the formulae and casks listed in `brewlist` and `casklist`.

##### [ohmyzsh.sh](ohmyzsh.sh)
Sets up [OhMyZsh](https://github.com/robbyrussell/oh-my-zsh) and symlinks my dotfiles from Dropbox.

### Handy Links in case of problems
- Download [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html)
- Download [Dropbox](https://www.dropbox.com/downloading?full=1&os=mac)
- Download [Xcode](https://itunes.apple.com/us/app/xcode/id497799835)
