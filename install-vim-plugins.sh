#!/bin/bash

set -e

PLUGIN_REPOS=(
  # linting
  'dense-analysis/ale'
  # typescript check
  'Quramy/tsuquyomi'
  # theme
  'jonathanfilip/vim-lucius'
  # speaks for itself
  'tpope/vim-markdown'
  'pangloss/vim-javascript'
  'mxw/vim-jsx'
  'leafgarland/typescript-vim'
  # comment toggling
  'tpope/vim-commentary'
  # nerd tree file explorer
  'scrooloose/nerdtree'
  # surround things with things
  'tpope/vim-surround'
  # nice minimal/pluggable statusline
  'tpope/vim-flagship'
  # vim and git make love
  'tpope/vim-fugitive'
  'tpope/vim-rhubarb'
  # enable repeating supported plugin maps with "."
  'tpope/vim-repeat'
  # pairs of handy bracket mappings
  'tpope/vim-unimpaired'
  # syntax checking hacks
  # disabled because it showed so many problems in es6+ files
  # 'scrooloose/syntastic'
  # gist magic
  'mattn/gist-vim'
  # vim interface to web api, gist-vim depends on it
  'mattn/webapi-vim'
  # fuzzy file searching
  'ctrlpvim/ctrlp.vim'
  # show the block cursor in normal mode, line cursor in insert mode
  'jszakmeister/vim-togglecursor'
  'tpope/vim-classpath'
  # motion around camel humps
  # 'bkad/CamelCaseMotion'
  # show vim status in gutter
  'airblade/vim-gitgutter'
  # navigate tmux and vim splits seamlessly
  'christoomey/vim-tmux-navigator'
  # show hex and rgb colors inline
  'ap/vim-css-color'
  # enable text object user plugins
  'kana/vim-textobj-user'
  # ae/ie for the entire region of the current buffer
  'kana/vim-textobj-entire'
  # # a_/i_ for a region between _s such as bar in foo_bar_baz
  # 'lucapette/vim-textobj-underscore'
  # # au/iu for a URL
  # 'mattn/vim-textobj-url'
  # # aq/iq for the closest pairs of quotes of any type
  # 'beloglazov/vim-textobj-quotes'
  # # a,/i, for an argument to a function
  # 'sgur/vim-textobj-parameter'
  # # al/il for the current line
  # 'kana/vim-textobj-line'
  # # af/if and aF/iF for a function / extensible for any language
  # 'kana/vim-textobj-function'
  # # adh/idh and others for various elements in diff(1) output
  # 'kana/vim-textobj-diff'
  # # ai/ii/aI/iI for indent level including/excluding surrounding lines
  # 'michaeljsmith/vim-indent-object'
)

git submodule update --recursive --init

for PLUGIN_REPO in ${PLUGIN_REPOS[@]}; do
  PLUGIN_NAME=$(basename $PLUGIN_REPO)
  if [ ! -d home/vim/bundle/${PLUGIN_NAME} ]; then
    git submodule add https://github.com/${PLUGIN_REPO}.git home/vim/bundle/${PLUGIN_NAME}
  fi
done
