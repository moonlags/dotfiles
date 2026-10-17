#!/bin/sh

sudo apt update
sudo apt upgrade

sudo apt install build-essential dunst fzf git extrepo maim xclip pipewire-pulse wireplumber refind spectrwm stow unzip x11-xserver-utils xinit alacritty cmus elogind suckless-tools x11-xkb-utils xserver-xorg-core

sudo extrepo update librewolf
sudo extrepo enable librewolf

sudo apt update
sudo apt install librewolf

mkdir -p ~/.config
mkdir -p ~/.local/bin

stow --dotfiles -t ~ home
