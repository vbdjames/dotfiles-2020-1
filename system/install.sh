#!/usr/bin/env bash
#
brew tap homebrew/cask-drivers

brew install 1password
brew install alfred
brew install asdf
brew install autojump
brew install beyond-compare
brew install calibre
brew install carbon-copy-cloner
brew install choosy
brew install displaylink
brew install fluid
brew install fromscratch
brew install git-flow
brew install google-chrome
brew install keyboard-maestro
brew install logseq
brew install mas
brew install neovim
brew install obsidian
brew install rectangle
brew install spotify
brew install the_silver_searcher

# sign in to the App Store
if ! mas account >/dev/null; then
  echo "Please open the App Store and sign in using your Apple ID ..."
  until mas account >/dev/null; do
    sleep 5
  done
fi
mas install 1055511498 # Day One
mas install  975937182 # Fantastical
mas install 1090488118 # Gemini 2: The Duplicate Finder
mas install  504284434 # Multi Monitor Wallpaper
mas install  926036361 # LastPass
mas install 1295203466 # Microsoft Remote Desktop
mas install  904280696 # Things 3
mas install 1529448980 # Reeder 5
mas install 1289197285 # MindNode
mas install  497799835 # Xcode
