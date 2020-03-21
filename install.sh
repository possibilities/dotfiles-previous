#!/bin/bash

set -e

# include hidden files when globbing
shopt -s dotglob

sudo apt-get update
sudo apt-get install --yes git jq tree watch python curl wget tmux zsh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 12 --lts

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn

yarn global add nodemon serve

# we need directories

echo " - linking dot files into \$HOME"

for file in home/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.$file_name"
  rm -rf $HOME/.$file_name
  ln -sf $PWD/$file $HOME/.$file_name
done

echo " - linking ssh files into \$HOME/.ssh"

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

for file in ssh/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.ssh/$file_name"
  rm -rf $HOME/.ssh/$file_name
  ln -sf $PWD/$file $HOME/.ssh/$file_name
done

echo " - linking binaries into \$HOME/local/bin"

mkdir -p $HOME/local/bin

for file in bin/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/local/bin/$file_name"
  rm -rf $HOME/local/bin/$file_name
  ln -sf $PWD/$file $HOME/local/bin/$file_name
done

echo " - deal with vim plugins"
./install-vim-plugins.sh || true

cd /tmp

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install || true
rm awscliv2.zip

echo done
