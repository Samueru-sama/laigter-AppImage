#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q laigter | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/azagaya/laigter/refs/heads/master/dist/laigter.png
export DESKTOP=https://raw.githubusercontent.com/azagaya/laigter/refs/heads/master/dist/laigter.desktop
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun /usr/bin/laigter

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
