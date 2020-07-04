#!/bin/bash

set -e

rm -rf .gitmodules
git rm -rf --cached home/vim/bundle/* || true
rm -rf home/vim/bundle/*
rm -rf .git/modules/home
git submodule deinit . || true
git restore .gitmodules

echo done
