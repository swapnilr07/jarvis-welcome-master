#!/bin/bash

green='\033[1;92m'
yellow='\033[1;93m'
white='\033[1;97m'
cyan='\033[1;96m'

echo -e "$green
====================================
Installing termux Parrot shell
===================================="
echo -e "$yellow
================================
Installing packages
================================"
apt update
apt install ruby -y
gem install lolcat
echo -e "$green
======================
Done
======================"
echo ""
echo ""
echo -e "$cyan
======================
Initializing...
======================"
rm -f $PREFIX/etc/bash.bashrc
cp bash.bashrc $PREFIX/etc
echo -e "$green
======================
Done
======================"
clear
echo -e "$green
======================================
Now type 'exit' & restart Termux
======================================"
echo ""
echo -e "$white"
