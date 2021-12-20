#!/bin/bash

set -e

export DOTFILE_PATH=${PWD}

# include hidden files when globbing
shopt -s dotglob

sudo apt-get update
sudo apt-get install --yes \
  unzip \
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
  xsel \
  whois \
  uuid \
  python3 \
  awscli \
  python3-pip \
  gnupg2 \
  pass \
  terminator \
  gnome-tweaks \
  gnome-shell-extension-pixelsaver \
  gnome-shell-extension-autohidetopbar \
  librecad \
  flatpak

if [ ${SHELL} == "/bin/bash" ]; then
  echo "setting zsh shell to default, enter password"
  chsh -s $(which zsh)
else
  echo " - zsh shell already default"
fi

if [[ -v UPGRADE ]] || ! [ -f "${HOME}/.has_install_git_from_ppa" ]; then
  echo " - installing git from ppa"
  sudo add-apt-repository ppa:git-core/ppa --yes
  sudo apt update
  sudo apt install git --yes
  touch "${HOME}/.has_install_git_from_ppa"
else
  echo " - git already installed"
fi

if [[ -v UPGRADE ]] || ! [ -f "/usr/bin/obs" ]; then
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

if [[ -v UPGRADE ]] || ! [ -f "/usr/bin/inkscape" ]; then
  echo " - installing inkscape from ppa"
  sudo add-apt-repository ppa:inkscape.dev/stable --yes
  sudo apt-get update
  sudo apt install inkscape --yes
else
  echo " - inkscape already installed"
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


# For telescope
if [[ -v UPGRADE ]] || [ -d "/usr/share/doc/ripgrep" ]; then
  echo " - installing ripgrep"
  sudo apt-get install ripgrep --yes
else
  echo " - ripgrep already installed"
fi

# For neovim < - > js integration
yarn global add neovim

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
  nvm install 14 --lts
  nvm install 12 --lts
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v yarn)" ]; then
  echo " - installing yarn"
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install --yes --no-install-recommends yarn
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
  nvim +'PlugInstall --sync' +qa
else
  curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


if [[ -v UPGRADE ]] || [ -d "${HOME}/miniconda3" ]
then
  echo " - miniconda already installed"
else
  MINICONDA_SCRIPT_NAME="Miniconda3-latest-Linux-x86_64.sh"

  rm -rf ${MINICONDA_SCRIPT_NAME}
  wget "https://repo.anaconda.com/miniconda/${MINICONDA_SCRIPT_NAME}"

  bash ${MINICONDA_SCRIPT_NAME} -b

  rm ${MINICONDA_SCRIPT_NAME}
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v kicad-nightly)" ]; then
  echo " - installing kicad-nightly from ppa"
  sudo add-apt-repository --yes ppa:kicad/kicad-dev-nightly
  sudo apt update
  sudo apt install --yes \
    kicad-nightly \
    kicad-nightly-footprints \
    kicad-nightly-libraries \
    kicad-nightly-packages3d \
    kicad-nightly-symbols \
    kicad-nightly-templates
else
  echo " - kicad-nightly already installed"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v cq-editor)" ]; then
  echo " - install cadquery and cadquery editor"
  conda install -c cadquery -c conda-forge cadquery=master --yes
  conda install -c cadquery -c conda-forge cq-editor=master --yes
else
  echo " - cadquery and cadquery editor already installed"
fi


if [[ -v UPGRADE ]] || ! [ -x "$(command -v tmuxp)" ]; then
  echo " - installing tmuxp"
  pip3 install tmuxp
else
  echo " - tmuxp already installed"
fi

if [[ -v UPGRADE ]] || ! [ -x "$(command -v black)" ]; then
  echo " - installing black"
  pip3 install black
else
  echo " - black already installed"
fi

echo " - linking dot files into \$HOME"

cd ${DOTFILE_PATH}

for file in home/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.$file_name"
  ln -sfT $PWD/$file $HOME/.$file_name
done

echo " - linking config files into \$HOME\config"

mkdir -p ~/.config

for file in config/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.config/$file_name"
  ln -sfT $PWD/$file $HOME/.config/$file_name
done

echo " - linking ssh files into \$HOME/.ssh"

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

for file in ssh/*
do
  file_name=`basename $file`
  echo "   * link $file to \$HOME/.ssh/$file_name"
  ln -sfT $PWD/$file $HOME/.ssh/$file_name
done

echo " - installing MS fonts so the browser looks non-terrible"

sudo add-apt-repository multiverse --yes
sudo apt update
sudo apt install ttf-mscorefonts-installer --yes

echo " - linking binaries into \$HOME/local/bin"

mkdir -p $HOME/local
ln -sf $PWD/local-bin $HOME/local/bin

sudo apt autoremove --yes

echo
echo "NOTES:"
echo "INSTALL UNITE-SHELL manually: https://github.com/hardpixel/unite-shell"
echo "INSTALL FONT: https://github.com/romkatv/powerlevel10k#manual-font-installation"
echo "SIGN OUT AND BACK IN AGAIN TO UPDATE SHELL (FIRST TIME ONLY)"
echo "RUN WITH UPGRADE=1 TO UPGRADE EVERYTHING"
