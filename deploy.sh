#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".zpreztorc" ]] && continue

    ln -snfv ${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete! $(tput sgr0)
