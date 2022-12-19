#!/bin/bash

echo "" > install.log

# Install Homebrew
echo "Installing Homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing xcode tools" && xcode-select --install

# Install ansible
echo "Installing Ansible" && brew install ansible && \

# Install geerlingguy role
echo "Installing Ansible collections" && ansible-galaxy collection install -r requirements.yaml -p vendor && \
echo "Installing Ansible roles" && ansible-galaxy install -r requirements.yaml -p vendor --force && \
echo "Running Ansible playbook" && ansible-playbook -K main.yaml && \
echo "Setting Git to use OSX keychain for credentials" && git config --global credential.helper osxkeychain && \
echo "Installing VS Code plugins" && ./install-vscode-plugins.sh