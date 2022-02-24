#!/usr/bin/env fish

fish_add_path /opt/homebrew/bin

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
