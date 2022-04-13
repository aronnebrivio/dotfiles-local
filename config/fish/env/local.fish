#!/usr/bin/env fish

set -gx LDFLAGS "-L/opt/homebrew/opt/gettext/lib -L/opt/homebrew/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@1.1/include"
# set -gx PATH /usr/local/homebrew/opt/libpq/bin $PATH

# asdf
source (brew --prefix asdf)/libexec/asdf.fish
