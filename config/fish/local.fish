#!/usr/bin/env fish

fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/homebrew/bin

# Pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

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

function ibrewRoutine
    ibrew update
    ibrew upgrade
    ibrew upgrade --cask
    ibrew cleanup
    ibrew doctor
end
