#!/usr/bin/env bash

echo "[$0] ..."

[ "$(id -un)" != "vagrant" ] && {
  echo "lo script va eseguito come utente vagrant."
  echo "Uscita..."
  exit 1
}

cd ~
mkdir ~/envs && cd ~/envs
virtualenv ansi23
source ~/envs/ansi23/bin/activate
cd ~/envs/ansi23
pip install --upgrade pip
pip install --upgrade setuptools
pip install ansible==2.3.3.0
deactivate
