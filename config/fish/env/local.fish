#!/usr/bin/env fish

set -gx LDFLAGS "-L/opt/homebrew/opt/gettext/lib -L/opt/homebrew/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@1.1/include"
# set -gx PATH /usr/local/homebrew/opt/libpq/bin $PATH

# asdf
source (brew --prefix asdf)/libexec/asdf.fish

# CA Labs CLI
complete --command cloudacademy-labs-cli --no-files --arguments "(env _CLOUDACADEMY_LABS_CLI_COMPLETE=complete_fish _TYPER_COMPLETE_FISH_ACTION=get-args _TYPER_COMPLETE_ARGS=(commandline -cp) cloudacademy-labs-cli)" --condition "env _CLOUDACADEMY_LABS_CLI_COMPLETE=complete_fish _TYPER_COMPLETE_FISH_ACTION=is-args _TYPER_COMPLETE_ARGS=(commandline -cp) cloudacademy-labs-cli"
