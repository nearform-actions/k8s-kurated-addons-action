#!/usr/bin/env bash

set -e

# Generate report of current env vars
echo "======================================================"
printenv | grep "KKA_.*"
echo "======================================================"

# Load helpers
source src/utils/helpers.sh $@

# Install envsubst
curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o envsubst
chmod +x envsubst
sudo mv envsubst /usr/local/bin

# Install asdf and expose to PATH
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
. $HOME/.asdf/asdf.sh

# Add asdf plugins
asdf plugin add kind https://github.com/reegnz/asdf-kind.git
asdf plugin add tilt https://github.com/virtualstaticvoid/asdf-tilt.git

# Install asdf tools
asdf install

# Run autodetection
pushd $KKA_APP_PATH
kka_autodetect_app_name
kka_autodetect_docker_registry
kka_autodetect_dockerfile_path
popd

# Run tilt
tilt ci
