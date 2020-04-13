#!/usr/bin/env fish

#
### FUNCTIONS
#
# Upgrade and clean system with PKG
function pkgRoutine
    pkg update
    pkg upgrade
end
