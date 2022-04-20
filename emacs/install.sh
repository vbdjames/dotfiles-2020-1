#!/usr/bin/env bash
#
# Reference: https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#on-macos
#
brew install git ripgrep
brew install coreutils fd
xcode-select --install
#
#
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
#
#
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
#
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ln -sf "$DIR/init.el" ~/.doom.d/init.el
ln -sf "$DIR/config.el" ~/.doom.d/config.el
ln -sf "$DIR/packages.el" ~/.doom.d/packages.el

