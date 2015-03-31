#!/bin/bash

dir=.dotfiles                    # dotfiles directory
olddir=.old_dotfiles             # old dotfiles backup directory

mkdir -p ~/$olddir

# change to the dotfiles directory
cd ~

# symlink dotfiles, making backup of existing
for file in `ls ~/$dir | grep -v -e 'bootstrap.sh' -e 'README.md'`; do
    echo ~/$file
    cp -rL ~/.$file ~/$olddir/
    rm -r ~/.$file
    ln -s $dir/$file .$file
done

