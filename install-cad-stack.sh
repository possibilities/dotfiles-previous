#!/bin/sh

set -e

if [ -d "${HOME}/miniconda3" ] 
then
  echo " - miniconda already installed"
else
  rm Miniconda3-py38_4.10.3-Linux-x86_64.sh
  wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh

  bash Miniconda3-py38_4.10.3-Linux-x86_64.sh -b

  rm Miniconda3-py38_4.10.3-Linux-x86_64.sh
fi

