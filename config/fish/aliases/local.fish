#!/usr/bin/env fish

alias ibrew "env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") arch -x86_64 /usr/local/homebrew/bin/brew"
