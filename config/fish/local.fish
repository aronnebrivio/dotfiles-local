#!/usr/bin/env fish

#
### FUNCTIONS
#
# Update and cleanup system with brew
function brewRoutine
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew doctor
end

# Launch LoL with mic support
function lol
    cd /Applications/GG/League\ of\ Legends.app/Contents/LoL/
    ./LeagueClient.app/Contents/MacOS/LeagueClient
end
