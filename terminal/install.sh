find . -name "*.terminal" | while read profile ; do 
    sh -c "open -g ${profile}"
done

defaults write com.apple.Terminal "Default Window Settings" solarized-dark
