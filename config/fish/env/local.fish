#!/usr/bin/env fish

set -gx LDFLAGS "-L/opt/homebrew/Cellar/gettext/0.21/lib -L/opt/homebrew/Cellar/openssl@1.1/1.1.1m/lib/"
set -gx CPPFLAGS "-I/opt/homebrew/Cellar/openssl@1.1/1.1.1m/include"
# set -gx PATH /usr/local/homebrew/opt/libpq/bin $PATH
