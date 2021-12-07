#!/usr/bin/env fish

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/homebrew/bin

# Pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

set -gx OPENSSL_ROOT /usr/local/homebrew/opt/openssl@1.1
set -gx LIBRARY_PATH $OPENSSL_ROOT/lib/
set -gx CPPFLAGS -I$OPENSSL_ROOT/include
set -gx LDFLAGS -L$OPENSSL_ROOT/lib
set -gx PKG_CONFIG_PATH $OPENSSL_ROOT/lib/pkgconfig
fish_add_path $OPENSSL_ROOT/bin

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

# PHP
function switchPhp
    if test $argv[1] = 8.0
        brew unlink php && brew link php
    else
        brew link php@$argv[1] --overwrite
    end
end

# Start/stop CA Labs dev environment
function startLabsLocalEnvironment
    cd /Users/aronne.brivio/Projects/CA/hagrid
    perl -pe 's|\QRUN apt-get update -y && apt-get install -y libpq-dev gcc putty && rm -rf /var/lib/apt/lists/*|RUN apt-get update -y && apt-get install -y libpq-dev libssl-dev gcc putty && rm -rf /var/lib/apt/lists/*|g' Dockerfile
    export ENABLE_PROFILING=True
    export async_cloud_env_session_setup=True
    export use_new_vcf_environment=True
    export USE_TERRAFORM_FOR_CODE_ENVIRONMENTS=True
    export disable_lab_bridge_connection_update_from_frontend=True
    export disable_lab_env_setup_update_from_frontend=True
    docker-compose up -d --build
    perl -pe 's|\QRUN apt-get update -y && apt-get install -y libpq-dev libssl-dev gcc putty && rm -rf /var/lib/apt/lists/*|RUN apt-get update -y && apt-get install -y libpq-dev gcc putty && rm -rf /var/lib/apt/lists/*|g' Dockerfile

    cd /Users/aronne.brivio/Projects/CA/doubtfire
    perl -pe 's|\QRUN apt-get update && apt-get install -y putty wget unzip|RUN apt-get update && apt-get install -y libssl-dev putty wget unzip|g' Dockerfile
    docker-compose up -d --build doubtfire-setup doubtfire-webapp doubtfire-celery-worker
    perl -pe 's|\QRUN apt-get update && apt-get install -y libssl-dev putty wget unzip|RUN apt-get update && apt-get install -y putty wget unzip|g' Dockerfile

    cd --
end

function stopLabsLocalEnvironment
    cd /Users/aronne.brivio/Projects/CA/hagrid
    docker-compose down

    cd /Users/aronne.brivio/Projects/CA/doubtfire
    docker-compose down

    cd --
end
