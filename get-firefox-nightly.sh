#!/bin/bash 
# Buildbot Firefox Source

echo "Removing old source directories"
rm -rf $HOME/source/firefox

echo "Creating Firefox source directories"
mkdir $HOME/source
mkdir $HOME/source/firefox
cd $HOME/source/firefox

# Get Firefox Source
cd $HOME/source/firefox

# Checkout dependencies
echo "Installing Checkout Dependencies"
sudo apt-get install git mercurial

echo "Fetching Firefox"
hg clone https://hg.mozilla.org/releases/mozilla-release/ src
echo "[trusted]" >> src/.hg/hgrc
echo "users = root" >> src/.hg/hgrc
chown root:root src/.hg/hgrc