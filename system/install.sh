#!/usr/bin/env bash
#
brew install 1password
brew install alfred
brew install asdf
brew install autojump
brew install calibre
brew install carbon-copy-cloner
brew install fromscratch
brew install google-chrome
brew install mas
brew install obsidian
brew install rectangle
brew install the_silver_searcher
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
mas install 1529448980 # Reeder 5

if [ ! -d /Applications/Epubor\ Ultimate.app ]; then
  curl https://download.epubor.com/epubor_ultimate.zip --output ~/Downloads/epubor_ultimate.zip
  unzip ~/Downloads/epubor_ultimate.zip -d ~/Downloads
  open ~/Downloads/Ultimate.pkg
fi
