#!/bin/bash

DOTFILES_DIRECTORY="${HOME}/dotfiles"
DOTFILES_TARBALL="https://github.com/uhsog/dotfiles/tarball/master"
DOTFILES_REMOTE_URL="git@github.com:uhsog/dotfiles.git"
# ディレクトリがなければダウンロード（と解凍）する
if [ ! -d ${DOTFILES_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOTFILES_DIRECTORY}

  if type "git" > /dev/null 2>&1; then
    git clone --recursive "${DOTFILES_REMOTE_URL}" "${DOTFILES_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOTFILES_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOTFILES_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete! $(tput sgr0)
fi
