#!/bin/bash
# Buildbot Chromium Source
# Get Chromium Source, --no-hooks

echo "Removing old source directories"
rm -rf $HOME/source/chromium
echo "Creating Chromium source directories"
mkdir $HOME/source
mkdir $HOME/source/chromium
cd $HOME/source/chromium

# Checkout dependencies
echo "Installing Checkout Dependencies"
#sudo apt-get install git 

sudo add-apt-repository ppa:git-core/ppa --yes --update
sudo apt-get install git --yes

# Get Chrome Depot Tools
echo "Cloning Depot Tools for Chromium"
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PATH:${HOME}/source/chromium/depot_tools" 
echo export PATH="$PATH:${HOME}/source/chromium/depot_tools" >> ~/.bashrc

echo "Fetching Chromium"
# Fetch Chromium Code
fetch --nohooks --no-history chromium


