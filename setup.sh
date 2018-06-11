#!/usr/bin/env bash

set -e

function writeConfig() {
    Cfgs=("$HOME/.bashrc" "$HOME/.zshrc")
    for cfg in "${Cfgs[@]}"; do
        echo $1 >> $cfg
    done
}

#
writeConfig ""
writeConfig "# dt-tools"

# add bin folder to ~/.bashrc & ~/.zshrc
writeConfig 'export PATH=$PATH:'"$(pwd)/bin"
echo "OK - ./bin added to PATH!"

# install-source.sh
for filename in ./**/install-source.sh; do
    writeConfig ". $(pwd)/$filename"
done
echo "OK - all install-source.sh files sourced!"

echo ""
echo "Please reopen the console to take effect! :)"
