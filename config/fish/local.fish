#!/usr/bin/env fish

fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/homebrew/bin

# Pyenv
# set -x PYENV_ROOT $HOME/.pyenv
# fish_add_path $PYENV_ROOT/bin

# if command -v pyenv 1>/dev/null 2>&1
#     eval (pyenv init -)
#     eval (pyenv virtualenv-init -)
#     eval (pyenv init --path)
# end
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

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
