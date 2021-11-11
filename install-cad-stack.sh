#!/bin/sh

set -e

MINICONDA_SCRIPT_NAME="Miniconda3-latest-Linux-x86_64.sh"

if [ -d "${HOME}/miniconda3" ]
then
  echo " - miniconda already installed"
else
  rm -rf ${MINICONDA_SCRIPT_NAME}
  wget "https://repo.anaconda.com/miniconda/${MINICONDA_SCRIPT_NAME}"

  bash ${MINICONDA_SCRIPT_NAME} -b

  rm ${MINICONDA_SCRIPT_NAME}
fi

conda install -c cadquery -c conda-forge cadquery=master --yes
conda install -c cadquery -c conda-forge cq-editor=master --yes

pip3 install black
