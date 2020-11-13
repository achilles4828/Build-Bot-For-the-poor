#!/bin/bash 
# Buildbot Webkit Source

echo "Removing old source directories"
rm -rf $HOME/source/webkit

echo "Creating Webkit source directories"
mkdir $HOME/source
mkdir $HOME/source/webkit
cd $HOME/source/webkit


# Checkout dependencies
echo "Installing Checkout Dependencies"
sudo apt-get install git subversion

# Get Webkit Source
cd $HOME/source/webkit
echo "Fetching Webkit"
svn checkout https://svn.webkit.org/repository/webkit/trunk WebKit

# git svn init --prefix=origin/ -T trunk https://svn.webkit.org/repository/webkit
# git config --replace svn-remote.svn.fetch trunk:refs/remotes/origin/master
# git config --replace svn-remote.svn.rewriteRoot https://svn.webkit.org/repository/webkit
# echo "Fetching Webkit"
# git svn fetch


# Alternate Checkout
# svn checkout https://svn.webkit.org/repository/webkit/trunk WebKit 