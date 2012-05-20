#!/bin/sh
echo "Creating directories..."
mkdir -pv home/.cache/mutt/header
mkdir -pv home/.mutt/mail
mkdir -pv home/.vim/autoload
mkdir -pv home/screenshots 

echo "Install Pathogen..."
curl 'www.vim.org/scripts/download_script.php?src_id=16224' > home/.vim/autoload/pathogen.vim
