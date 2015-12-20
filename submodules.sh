#!/bin/bash

git submodule add https://github.com/mattn/gist-vim.git home/vim/bundle/gist

git submodule add https://github.com/vim-ruby/vim-ruby.git home/vim/bundle/ruby
git submodule add https://github.com/tpope/vim-markdown.git home/vim/bundle/markdown
git submodule add https://github.com/othree/yajs.vim.git home/vim/bundle/javascript
git submodule add https://github.com/kchmck/vim-coffee-script.git home/vim/bundle/coffee
git submodule add https://github.com/klen/python-mode.git home/vim/bundle/python
git submodule add https://github.com/guns/vim-clojure-static.git home/vim/bundle/clojure-static

git submodule add https://github.com/tomtom/tcomment_vim.git home/vim/bundle/tcomment
git submodule add https://github.com/tpope/vim-surround.git home/vim/bundle/surround
git submodule add https://github.com/tpope/vim-flagship.git home/vim/bundle/flagship
git submodule add https://github.com/tpope/vim-fugitive.git home/vim/bundle/fugitive
git submodule add https://github.com/tpope/vim-repeat.git home/vim/bundle/repeat
git submodule add https://github.com/tpope/vim-vinegar.git home/vim/bundle/vinegar
git submodule add https://github.com/tpope/vim-unimpaired.git home/vim/bundle/unimpaired
git submodule add https://github.com/scrooloose/syntastic.git home/vim/bundle/syntastic
git submodule add https://github.com/Lokaltog/vim-easymotion.git home/vim/bundle/easymotion
git submodule add https://github.com/kien/ctrlp.vim.git home/vim/bundle/ctrlp
git submodule add https://github.com/jszakmeister/vim-togglecursor.git home/vim/bundle/togglecursor
git submodule add https://github.com/kien/rainbow_parentheses.vim.git home/vim/bundle/rainbow_parentheses
git submodule add https://github.com/tpope/vim-fireplace.git home/vim/bundle/fireplace
git submodule add https://github.com/tpope/vim-classpath.git home/vim/bundle/classpath
git submodule add https://github.com/bkad/CamelCaseMotion.git home/vim/bundle/CamelCaseMotion

# text objects
git submodule add https://github.com/kana/vim-textobj-user.git home/vim/bundle/textobj-user
# ae/ie for the entire region of the current buffer
git submodule add https://github.com/kana/vim-textobj-entire.git home/vim/bundle/textobj-entire
# a_/i_ for a region between _s such as bar in foo_bar_baz
git submodule add https://github.com/lucapette/vim-textobj-underscore.git home/vim/bundle/textobj-underscore
# au/iu for a URL
git submodule add https://github.com/mattn/vim-textobj-url.git home/vim/bundle/textobj-url
# aq/iq for the closest pairs of quotes of any type
git submodule add https://github.com/beloglazov/vim-textobj-quotes.git home/vim/bundle/textobj-quotes
# a,/i, for an argument to a function
git submodule add https://github.com/sgur/vim-textobj-parameter.git home/vim/bundle/textobj-parameter
# al/il for the current line
git submodule add https://github.com/kana/vim-textobj-line.git home/vim/bundle/textobj-line
# af/if and aF/iF for a function / extensible for any language
git submodule add https://github.com/kana/vim-textobj-function.git home/vim/bundle/textobj-function
# adh/idh and others for various elements in diff(1) output
git submodule add https://github.com/kana/vim-textobj-diff.git home/vim/bundle/textobj-diff
# ai/ii/aI/iI for indent level including/excluding surrounding lines
git submodule add https://github.com/michaeljsmith/vim-indent-object.git home/vim/bundle/indent-object
