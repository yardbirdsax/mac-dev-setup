#!/bin/bash
IFS=$'\n'
set -f
for p in $(cat < vscode-plugins.txt)
do
    echo "Installing ${p}"
    code --install-extension ${p} >> code-extension-install.log 2>&1
    if [ $? -ne 0 ]; then
        echo "ERROR!"
        exit 1
    fi
done