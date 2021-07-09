# Sets reasonable (to me) macOS defaults.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock no-glass -bool true
defaults write com.apple.dock no-bouncing -bool true

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# New Fiinder windows open home directory
defaults write com.apple.Finder NewWindowTargetPath file:///Users/dougjames/

# Misc finder settings
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Remove all the persistent-apps
defaults write com.apple.dock persistent-apps '<dict></dict>'

# Ensure the application folder is shown in the dock
if [[ $(defaults read com.apple.dock persistent-others | grep "Applications") == '' ]]
then
    defaults write com.apple.dock persistent-others -array-add '<dict><key>tile-type</key><string>directory-tile</string><key>tile-data</key><dict><key>displayas</key><integer>1</integer><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
fi

# Set up hot corners
# Possible values:
#  0: no-op
#  2: Mission Control (all windows)
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# top left corner - no-op
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# top right corner - disable screen saver
defaults write com.apple.dock wvous-tr-corner -int 6
defaults write com.apple.dock wvous-tr-modifier -int 0

# bottom left corner - no-op
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

# bottom right corner - put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

# Restart the Dock to put all of this into effect
killall Dock
killall Finder
