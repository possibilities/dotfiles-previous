#!/bin/sh

set -e

cd $HOME

STAMP=$(date +"%s")

tar -pzcvf /mnt/d/backup.${STAMP}.tgz \
  --exclude='.m2' \
  --exclude='.next' \
  --exclude='.vscode-server' \
  --exclude='.dbus' \
  --exclude='.nvm' \
  --exclude='.cache' \
  --exclude='.npm' \
  --exclude='node_modules' \
  --exclude='desktop.ini' \
  ${HOME} \
  /mnt/c/Users/mike/Documents/ShareX \
  /mnt/c/Users/mike/Local\ Settings/Application\ Data/Mizage\ LLC/Divvy \
  /mnt/c/Users/mike/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup
