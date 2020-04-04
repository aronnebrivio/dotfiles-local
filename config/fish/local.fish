#!/usr/bin/env fish

#
### FUNCTIONS
#
# Upgrade and clean system with APT
function aptRoutine
	sudo apt update 2>/dev/null
	sudo apt dist-upgrade
	sudo apt autoremove -y
	sudo apt autoclean
end
