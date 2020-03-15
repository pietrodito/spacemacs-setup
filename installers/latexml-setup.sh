#!/bin/bash

AUR="$HOME/Comp/AUR"

sudo rm --recursive --force "$AUR/perl-text-unidecode"
git clone https://aur.archlinux.org/perl-text-unidecode.git "$AUR/perl-text-unidecode"

cd "$AUR/perl-text-unidecode"
makepkg --syncdeps --install --rmdeps --clean --noconfirm --needed

sudo rm --recursive --force "$AUR/perl-latexml"
git clone https://aur.archlinux.org/perl-latexml.git "$AUR/perl-latexml"

cd "$AUR/perl-latexml"
makepkg --syncdeps --install --rmdeps --clean --noconfirm --needed
