#!/usr/bin/env fish

function pyclean
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
end

# Upgrade and clean system with APT
function aptRoutine
	sudo apt update 2>/dev/null
	sudo apt dist-upgrade
	sudo apt autoremove -y
	sudo apt autoclean
end
