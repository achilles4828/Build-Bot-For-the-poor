#!/bin/bash
# Buildbot Docker Deployer
WORKDIR=`pwd`
echo "[+] Buildbot Docker Deployer for Chrome, Webkit, and Firefox"

echo "[+] Source Code for the above applications can be cloned by executing <get-chromium-nightly.sh>, <get-webkit-nightly.sh>, and <get-firefox-nightly.sh>."
read -p "[!] <Required on fresh install> Do you want this script to fetch the source code? CAUTION! This can take multiple hours depending upon your internet bandwidth. (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./get-chromium-nightly.sh
    ./get-firefox-nightly.sh
    ./get-webkit-nightly.sh      
    chmod -R 777 $HOME/source
fi

read -p "[!] <Required on fresh install> Do you want to clean up and reset the builds folder? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf $HOME/builds
    mkdir $HOME/builds
    mkdir $HOME/builds/chromium
    mkdir $HOME/builds/firefox
    mkdir $HOME/builds/webkit
    chmod -R 777 $HOME/builds
fi

echo "HOME=$HOME" > .env

echo  "[!] Applying WebKit patch"
cd $HOME/source/webkit/Webkit
git apply $WORKDIR/build_worker/webkit/webkit.patch

echo "[!] This deployer requires docker and docker-compose. Make sure you install these components before proceeding further."
read -p "[+] Press any key to continue "

cd $WORKDIR
# Remove previous images
echo "[!] Removing Previous Images"
docker-compose down --remove-orphans
docker-compose rm
docker-compose build

# Start everything
echo "[+] Starting Buildbot CI"
docker-compose up -d
echo "[+] Buildbot is up and running on port 8010."
echo "[!] To view build-master logs, run: <docker logs -f buildbot-master>"