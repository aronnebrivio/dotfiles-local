#!/usr/bin/env fish

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/libpq/bin

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

function pyclean
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
end

# Env variables
#set -x DOCKER_HOST unix://$HOME/.colima/default/docker.sock
set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

set -gx GRPC_PYTHON_BUILD_SYSTEM_OPENSSL 1
set -gx GRPC_PYTHON_BUILD_SYSTEM_ZLIB 1
