#!/usr/bin/env fish

#
### FUNCTIONS
#
# Update and cleanup system with brew
function brewRoutine
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
    brew doctor
end

# Launch LoL with mic support
function lol
    cd /Applications/League\ of\ Legends.app/Contents/LoL/
    ./LeagueClient.app/Contents/MacOS/LeagueClient
end
