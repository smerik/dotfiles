#!/bin/sh
echo "Creating directories..."
mkdir -pv home/.cache/bash
mkdir -pv home/.cache/mutt/header
mkdir -pv home/.mutt/mail
mkdir -pv home/.vim/autoload
mkdir -pv home/screenshots

echo "Initializing submodules..."
git submodule init
git submodule update
