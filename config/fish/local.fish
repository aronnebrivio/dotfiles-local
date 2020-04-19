#!/usr/bin/env fish

#
### FUNCTIONS
#
# apt -> apt-fast if present
function apt
    if type -q apt-fast
        apt-fast $argv
    else
        /usr/bin/apt $argv
    end
end

# Upgrade and clean system with APT
function aptRoutine
	sudo apt update 2>/dev/null
	sudo apt dist-upgrade
	sudo apt autoremove -y
	sudo apt autoclean
end
