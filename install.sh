#!/bin/bash

set -e

# include hidden files when globbing
shopt -s dotglob

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

echo " - deal with submodules"
./submodules.sh
git submodule update --init

echo done
