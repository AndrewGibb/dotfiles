# Auto hide nad show dock
defaults write com.apple.dock autohide -bool true

# Display full path as window title.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show ~/Library
chflags nohidden ~/Library/

