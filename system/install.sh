#!/usr/bin/env bash
#
brew install -q 1password
brew install alfred
brew install calibre
brew install google-chrome
brew install mailmate
brew install mas
brew install obsidian
brew install rectangle
brew install tower

# sign in to the App Store
if ! mas account >/dev/null; then
  echo "Please open the App Store and sign in using your Apple ID ..."
  until mas account >/dev/null; do
    sleep 5
  done
fi
mas install  975937182 # Fantastical
mas install  504284434 # Multi Monitor Wallpaper
mas install  926036361 # LastPass
mas install 1295203466 # Microsoft Remote Desktop
mas install  904280696 # Things 3