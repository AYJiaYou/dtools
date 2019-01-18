#!/usr/bin/env bash

set -e

# Write $1 to $2 if it wasn't there.
write_config() {
    if grep -Fqs "$1" "$2"; then
        return 0
    fi

    echo "" >> $2
    echo "# https://github.com/AYJiaYou/dtools $(date)" >> $2
    echo $1 >> $2

    echo "$2 added:"
    echo ""
    echo "  $1"
    echo ""
    return 0
}

# Write $1 to popular terminals' initial script.
write_config_to_terminals() {
    # Bash
    if [[ -e "$HOME/.bashrc" ]]; then
        write_config "$1" "$HOME/.bashrc" 
    fi

    # zsh
    if [[ -e "$HOME/.zshrc" ]]; then
        write_config "$1" "$HOME/.zshrc"
    fi
}

# Source target script $1 to different terminals' initial script.
source_target() {
    local path="$(pwd)/$1"
    local cmd="[[ -f \"$path\" ]] && source \"$path\""
    write_config_to_terminals "$cmd"
}

# add bin folder to ~/.bashrc & ~/.zshrc
cmd='export PATH=$PATH:'"$(pwd)/bin"
write_config_to_terminals "$cmd"

# install-source.sh
for filename in ./**/install-source.sh; do
    source_target "$filename"
done

echo ""
echo "FINISH"
echo "Please reopen the console to take effect! :)"




