#!/bin/bash

echo "" > install.log

# Install Homebrew
# echo "Installing Homebrew" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# echo "Installing xcode tools" && xcode-select --install

export PATH=$HOME/.asdf/shims:$(/opt/homebrew/bin/brew --prefix)/bin:$PATH
export ASDF_PYAPP_INCLUDE_DEPS=1

# Install dependencies for Python
echo "Installing Python dependencies" && \
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2

# Install asdf
echo "Installing ASDF" && brew install asdf && \
echo "Installing Python plugin for ASDF" && asdf plugin add python && \
asdf install && \
echo "Installing Ansible" && pip install ansible && \

# Install geerlingguy role
echo "Installing Ansible collections" && ansible-galaxy collection install -r requirements.yaml && \
echo "Installing Ansible roles" && ansible-galaxy install -r requirements.yaml -p vendor --force
echo "Running Ansible playbook" && ansible-playbook -K main.yaml && \
echo "Setting Git to use OSX keychain for credentials" && git config --global credential.helper osxkeychain
