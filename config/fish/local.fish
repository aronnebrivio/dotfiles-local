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

# PHP
function switchPhp
    if test $argv[1] = 8.0
        brew unlink php && brew link php
    else
        brew link php@$argv[1] --overwrite
    end
end

# Start/stop DIC dev environment
function startDicDevEnvironment
    cd /Users/aronnebrivio/Progetti/MadBit
    ./start-dic-dev-environment.sh
    cd -
end

function stopDicDevEnvironment
    cd /Users/aronnebrivio/Progetti/MadBit
    ./stop-dic-dev-environment.sh
    cd -
end
