#!/bin/sh

set -e

BACKUP_PATH=/mnt/c/Users/mike/home/mike

# TEMP remove dirs
rm -rf ~/.ssh
rm -rf ~/.aws
rm -rf ~/.config
rm -rf ~/code
rm -rf ~/src

echo copying configs from ~
cp -r --no-clobber ${BACKUP_PATH}/.aws ~/.aws
cp -r ${BACKUP_PATH}/.gist-vim ~/.gist-vim
cp -r ${BACKUP_PATH}/.npmrc ~/.npmrc
cp -r ${BACKUP_PATH}/.zsh_history ~/.zsh_history

echo copying ~/.ssh and ensuring permissions
cp -r --no-clobber ${BACKUP_PATH}/.ssh ~/.ssh
chmod 700 ~/.ssh
chmod 644 ~/.ssh/known_hosts
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/config || true
chmod 644 ~/.ssh/authorized_keys || true

echo copying configs from ~/.config
mkdir -p ~/.config
cp -r --no-clobber ${BACKUP_PATH}/.config/hub ~/.config/hub
cp -r --no-clobber ${BACKUP_PATH}/.config/lab.hcl ~/.config/lab.hcl

echo copying all ~/code
cp -r --no-clobber ${BACKUP_PATH}/code ~/code

echo copying all ~/src
cp -r --no-clobber ${BACKUP_PATH}/src ~/src
