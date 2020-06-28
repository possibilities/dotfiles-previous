#!/bin/sh

set -e

cd $HOME

STAMP=$(date +"%s")

tar -pzcvf /mnt/c/Users/mike/backup.${STAMP}.tgz \
  --exclude='.m2' \
  --exclude='.next' \
  --exclude='.vscode-server' \
  --exclude='.dbus' \
  --exclude='.nvm' \
  --exclude='.cache' \
  --exclude='.npm' \
  --exclude='node_modules' \
  /mnt/c/Users/mike/Documents/ShareX \
  /mnt/c/Users/mike/Local\ Settings/Application\ Data/Mizage\ LLC/Divvy
# ${HOME}

#%AppData%\Microsoft\Windows\Start Menu\Programs\Startup

#tar -pzcvf --append /mnt/c/Users/mike/backup.${STAMP}.tgz \

##C:\Users\mike\Documents\ShareX
