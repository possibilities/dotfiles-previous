#!/bin/bash

set -e

# include hidden files when globbing
shopt -s dotglob

sudo apt-get update
sudo apt-get install --yes \
  unzip \
  git \
  jq \
  tree \
  watch \
  python \
  curl \
  wget \
  tmux \
  zsh \
  uuid \
  xclip \
  whois \
  uuid \
  vim-gtk \
  git-secret \
  python3 \
  awscli \
  python3-pip

# For puppeteer
sudo apt-get install --yes \
  gconf-service \
  libasound2 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libc6 \
  libcairo2 \
  libcups2 \
  libdbus-1-3 \
  libexpat1 \
  libfontconfig1 \
  libgcc1 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libstdc++6 \
  libx11-6 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  ca-certificates \
  fonts-liberation \
  libappindicator1 \
  libnss3 \
  lsb-release \
  xdg-utils \
  libgbm-dev \
  wget

if [ -v "$ZSH_NAME" ]; then
  chsh -s $(which zsh)
else
  echo " - zsh already installed"
fi

if [ -d "${HOME}/.nvm" ] 
then
  echo " - nvm already installed"
else
  echo " - installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install 12 --lts
fi

if ! [ -x "$(command -v tmuxp)" ]; then
  echo " - installing tmuxp"
  pip3 install --quiet --user tmuxp
else
  echo " - tmuxp already installed"
fi

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn

echo " - installing apps globally from npm"
if ! [ -x "$(command -v sloc)" ]; then
  yarn global add sloc
else
  echo " - sloc already installed"
fi
if ! [ -x "$(command -v nodemon)" ]; then
  yarn global add nodemon
else
  echo " - nodemon already installed"
fi
if ! [ -x "$(command -v sloc)" ]; then
  yarn global add serve
else
  echo " - serve already installed"
fi

IS_HYPERFINE_INSTALLED="$(command -v hyperfine)"
if ! [ -x ${IS_HYPERFINE_INSTALLED} ]; then
  wget \
    https://github.com/sharkdp/hyperfine/releases/download/v1.10.0/hyperfine_1.10.0_amd64.deb \
    -O /tmp/hyperfine.deb
  sudo dpkg -i /tmp/hyperfine.deb
else
  echo " - hyperfine already installed"
fi

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

if ! [ -x ${IS_HYPERFINE_INSTALLED} ]; then
  echo WARNINGS:
  echo  " - INSTALLED HYPERFINE HARDCODED VERSION NUMBER, SEE dotfiles/install.sh"
fi

echo
echo ALL DONE, COMPLETE, OK, NICE, WORD, HAVE FUN SUCKA
