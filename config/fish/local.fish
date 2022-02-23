#!/usr/bin/env fish

fish_add_path /opt/homebrew/bin

# Pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Created by `pipx` on 2021-12-16 10:15:00
fish_add_path $HOME/.local/bin

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
