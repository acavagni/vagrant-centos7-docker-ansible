#!/usr/bin/env bash

echo "Executing [04-vagrant-user-config-env.sh] ..."

[ "$(id -un)" != "vagrant" ] && {
  echo "lo script va eseguito come utente vagrant."
  echo "Uscita..."
  exit 1
}

cd ~
echo -e "set number\ncolorscheme delek\nset nohlsearch" >> ~/.vimrc
echo -e "\nexport HISTSIZE=8000\nexport HISTFILESIZE=8000\nexport HISTCONTROL=ignoredups\nexport HISTTIMEFORMAT='%F %T '" >> ~/.bash_profile
