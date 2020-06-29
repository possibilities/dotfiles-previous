#!/bin/sh

set -e

BACKUP_PATH="/mnt/d/backup.1593380838.tgz"

cd /

#echo copying configs
#tar -p -xf ${BACKUP_PATH} home/mike/.aws
#tar -p -xf ${BACKUP_PATH} home/mike/.gist-vim
#tar -p -xf ${BACKUP_PATH} home/mike/.npmrc
#tar -p -xf ${BACKUP_PATH} home/mike/.zsh_history
#tar -p -xf ${BACKUP_PATH} home/mike/.ssh
#tar -p -xf ${BACKUP_PATH} home/mike/.config/hub
#tar -p -xf ${BACKUP_PATH} home/mike/.config/lab.hcl
#echo copying code
#tar -p -xf ${BACKUP_PATH} home/mike/code
#echo copying src
#tar -p -xf ${BACKUP_PATH} home/mike/src
#
#echo copying windows resources
tar -p -xf ${BACKUP_PATH} mnt/c/Users/mike/Documents/ShareX
tar -p -xf ${BACKUP_PATH} mnt/c/Users/mike/Local\ Settings/Application\ Data/Mizage\ LLC/Divvy/shortcuts.db
tar -p -xf ${BACKUP_PATH} mnt/c/Users/mike/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup
