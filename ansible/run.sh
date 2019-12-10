#!/bin/bash

echo "" > install.log

# Install Homebrew
echo "Installing Homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing xcode tools" && xcode-select --install

# Install ansible
echo "Installing Ansible" && brew install ansible && \

# Install geerlingguy role
echo "Installing geerlingguy Ansible role" && ansible-galaxy install -r requirements.yaml -p vendor --force
