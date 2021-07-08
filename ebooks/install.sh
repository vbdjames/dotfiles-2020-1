#!/usr/bin/env bash
#
brew install kindle

if [ ! -d /Applications/Epubor\ Ultimate.app ]; then
  curl https://download.epubor.com/epubor_ultimate.zip --output ~/Downloads/epubor_ultimate.zip
  unzip ~/Downloads/epubor_ultimate.zip -d ~/Downloads
  open ~/Downloads/Ultimate.pkg
fi

chmod -x /Applications/Kindle.app/Contents/MacOS/renderer-test

