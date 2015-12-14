#!/bin/bash

set -e

PLUGIN_REPOS=(
  # colors

  # nice grey and black
  'jonathanfilip/vim-lucius'

  # languages

  # ruby
  'vim-ruby/vim-ruby'
  # markdown
  'tpope/vim-markdown'
  # js
  'othree/yajs.vim'
  # coffee
  'kchmck/vim-coffee-script'
  # python
  'klen/python-mode'
  # clojure
  'guns/vim-clojure-static'
  # stylus
  'wavded/vim-stylus'
  # jsx
  'mxw/vim-jsx'
  # jade
  'digitaltoad/vim-jade'

  # utils

  # comment toggling
  'tpope/vim-commentary'
  # surround things with things
  'tpope/vim-surround'
  # nice minimal/pluggable statusline
  'tpope/vim-flagship'
  # vim and git make love
  'tpope/vim-fugitive'
  # enable repeating supported plugin maps with "."
  'tpope/vim-repeat'
  # makes netrw nicer
  'tpope/vim-vinegar'
  # pairs of handy bracket mappings
  'tpope/vim-unimpaired'
  # syntax checking hacks
  'scrooloose/syntastic'
  # gist magic
  'mattn/gist-vim'
  # motions on speed
  # 'Lokaltog/vim-easymotion'
  # fuzzy file searching
  'kien/ctrlp.vim'
  # show the block cursor in normal mode, line cursor in insert mode
  'jszakmeister/vim-togglecursor'
  # color code paren pairs
  'kien/rainbow_parentheses.vim'
  # clojure repl
  # 'tpope/vim-fireplace'
  'tpope/vim-classpath'
  # motion around camel humps
  'bkad/CamelCaseMotion'
  # show vim status in gutter
  'airblade/vim-gitgutter'
  # navigate tmux and vim splits seamlessly
  'christoomey/vim-tmux-navigator'

  # text objects

  # enable text object user plugins
  'kana/vim-textobj-user'
  # ae/ie for the entire region of the current buffer
  'kana/vim-textobj-entire'
  # a_/i_ for a region between _s such as bar in foo_bar_baz
  'lucapette/vim-textobj-underscore'
  # au/iu for a URL
  'mattn/vim-textobj-url'
  # aq/iq for the closest pairs of quotes of any type
  'beloglazov/vim-textobj-quotes'
  # a,/i, for an argument to a function
  'sgur/vim-textobj-parameter'
  # al/il for the current line
  'kana/vim-textobj-line'
  # af/if and aF/iF for a function / extensible for any language
  'kana/vim-textobj-function'
  # adh/idh and others for various elements in diff(1) output
  'kana/vim-textobj-diff'
  # ai/ii/aI/iI for indent level including/excluding surrounding lines
  'michaeljsmith/vim-indent-object'
)

for PLUGIN_REPO in ${PLUGIN_REPOS[@]}; do
  PLUGIN_NAME=$(basename $PLUGIN_REPO)
  if [ ! -d home/vim/bundle/${PLUGIN_NAME} ]; then
    git submodule add https://github.com/${PLUGIN_REPO}.git home/vim/bundle/${PLUGIN_NAME}
  fi
done
