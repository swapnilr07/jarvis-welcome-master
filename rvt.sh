#!/data/data/com.termux/files/usr/bin/bash
cd "$(dirname "$0")" || exit 1
pip install bs4 requests
rm -f "$PREFIX/etc/bash.bashrc"
cp Revert/bash.bashrc "$PREFIX/etc/bash.bashrc"
rm -rf "$HOME/.jarvis-welcome"
python Revert/Thanks.py
