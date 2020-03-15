#!/bin/bash

source ./installers/source-to-set-repo-dir-var.sh


if ! pip list | grep setuptools
then {
    sudo pacman -Syu python-setuptools
}
else
    echo setup is already installed.
fi

sudo pip install Pygments
