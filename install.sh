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
  git-secret \
  python3 \
  awscli \
  python3-pip \
  gnupg2 \
  pass \
  terminator \
  gnome-tweaks \
  gnome-shell-extension-pixelsaver \
  gnome-shell-extension-autohidetopbar

if [[ -v UPGRADE ]] || ! [ -x "$(command -v polybar)" ]; then
  echo " - installing polybar from source"
  # polybar
  sudo apt-get install --yes \
    cmake \
    cmake-data \
    libcairo2-dev \
    libxcb1-dev \
    libxcb-ewmh-dev \
    libxcb-icccm4-dev \
    libxcb-image0-dev \
    libxcb-randr0-dev \
    libxcb-util0-dev \
    libxcb-xkb-dev \
    pkg-config \
    i3-wm \
    python3-xcbgen \
    xcb-proto \
    libxcb-xrm-dev \
    libasound2-dev \
    libmpdclient-dev \
    libiw-dev \
    libcurl4-openssl-dev \
    libpulse-dev \
    libxcb-composite0-dev \
    libjsoncpp-dev \
    libuv1-dev \
    python3-xcbgen \
    python3-sphinx

  sudo ln -sf /usr/include/jsoncpp/json/ /usr/include/json

  sudo rm -rf /tmp/polybar
  git clone https://github.com/jaagr/polybar.git /tmp/polybar
  cd /tmp/polybar

  # Conda interferes with this build so we move it out of the way and back
  if [ -d "${HOME}/miniconda3" ]; then
      mv ${HOME}/miniconda3 ${HOME}/miniconda3.bak
  fi
  AUTO=ON ./build.sh || true
  if [ -d "${HOME}/miniconda3.bak" ]; then
      mv ${HOME}/miniconda3.bak ${HOME}/miniconda3
  fi
else
  echo " - polybar already installed"
fi

if [[ -v UPGRADE ]] || [ ${SHELL} == "/usr/bin/bash" ]; then
  echo "setting zsh shell to default, enter password"
  chsh -s $(which zsh)
else
  echo " - zsh shell already default"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v git)" ]; then
  echo " - installing git from ppa"
  sudo add-apt-repository ppa:git-core/ppa --yes
  sudo apt update
  sudo apt install git --yes
else
  echo " - git already installed"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v obs)" ]; then
  echo " - installing obs from ppa"
  sudo apt-get install --yes \
    ffmpeg \
    v4l2loopback-dkms \

  sudo add-apt-repository ppa:obsproject/obs-studio --yes
  sudo apt update
  sudo apt install obs-studio --yes
else
  echo " - obs already installed"
fi

# TODO install hub in some way, doesn't work on ubuntu vm

if [[ -v UPGRADE ]] || ! [ -x "$(command -v nvim)" ]; then
  echo " - installing neovim from ppa"
  sudo add-apt-repository ppa:neovim-ppa/unstable --yes
  sudo apt-get update
  sudo apt-get install neovim --yes
else
  echo " - neovim already installed"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v lab)" ]; then
  echo " - installing lab"
  curl -s https://raw.githubusercontent.com/zaquestion/lab/master/install.sh | sudo bash
else
  echo " - lab already installed"
fi

if [[ -v UPGRADE ]] || [ -d "${HOME}/.nvm" ] 
then
  echo " - nvm already installed"
else
  echo " - installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install 12 --lts
  nvm install 14 --lts
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v tmuxp)" ]; then
  echo " - installing tmuxp"
  pip3 install --quiet --user tmuxp
else
  echo " - tmuxp already installed"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v yarn)" ]; then
  echo " - installing yarn"
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install --no-install-recommends yarn
else
  echo " - yarn already installed"
fi

if [[ -v UPGRADE ]] || [ -d "${HOME}/.powerlevel10k" ]
then
  echo " - power level 10k already installed"
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
fi

echo " - deal with vim plugins"

mkdir -p ${HOME}/.vim/backups

if [[ -v UPGRADE ]] || [ -f "${HOME}/.vim/autoload/plug.vim" ]
then
  echo " - vim plug already installed"
  vim +'PlugInstall --sync' +qa
else
  curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# Python

MINICONDA_SCRIPT_NAME="Miniconda3-latest-Linux-x86_64.sh"

if [[ -v UPGRADE ]] || [ -d "${HOME}/miniconda3" ]
then
  echo " - miniconda already installed"
else
  rm -rf ${MINICONDA_SCRIPT_NAME}
  wget "https://repo.anaconda.com/miniconda/${MINICONDA_SCRIPT_NAME}"

  bash ${MINICONDA_SCRIPT_NAME} -b

  rm ${MINICONDA_SCRIPT_NAME}
fi

# Cad stack
if [[ -v UPGRADE ]] || ! [ -x "$(command -v kicad-nightly)" ]; then
  echo " - installing kicad-nightly from ppa"
  sudo add-apt-repository --yes ppa:kicad/kicad-5.1-releases
  sudo apt update
  sudo apt install --yes --install-recommends kicad
else
  echo " - kicad-nightly already installed"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v obs)" ]; then
  echo " - install cadquery and cadquery editor"
  conda install -c cadquery -c conda-forge cadquery=master --yes
  conda install -c cadquery -c conda-forge cq-editor=master --yes
else
  echo " - cadquery and cadquery editor already installed"
fi


if [[ -v UPGRADE ]] || ! [ -x "$(command -v black)" ]; then
  echo " - installing black"
  pip3 install black
else
  echo " - black already installed"
fi

echo " - linking dot files into \$HOME"

for file in home/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.$file_name"
  rm -rf $HOME/.$file_name
  ln -sf $PWD/$file $HOME/.$file_name
done

echo " - linking config files into \$HOME\config"

mkdir -p ~/.config

for file in config/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.config/$file_name"
  rm -rf $HOME/.config/$file_name
  ln -sf $PWD/$file $HOME/.config/$file_name
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


echo
echo ALL DONE, COMPLETE, OK, NICE, WORD, HAVE FUN SUCKA
echo INSTALL UNITE-SHELL manually: https://github.com/hardpixel/unite-shell
