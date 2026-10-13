command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
PS1='\[\e[31m\]┌─[\[\e[37m\]\T\[\e[31m\]]─────\e[1;93m[root]\e[0;31m───[\#]\n|\n\e[0;31m└─[\[\e[31m\]\e[0;35m\W\[\e[31m\]]────►\e[1;92m'
clear
JARVIS_SOUND="$HOME/.jarvis-welcome/terminal.mp3"
if [ -f "$JARVIS_SOUND" ] && command -v mpv >/dev/null 2>&1; then
        mpv --no-video --really-quiet --ao=opensles "$JARVIS_SOUND" >/dev/null 2>&1 \
        || mpv --no-video --really-quiet "$JARVIS_SOUND" >/dev/null 2>&1
fi
clear
echo -e "Created By \e[5mSwapnilr07 "
echo "----------------------------" | lolcat
echo "
o      o        8
8      8        8
8      8 .oPYo. 8 .oPYo. .oPYo. ooYoYo. .oPYo.
8  db  8 8oooo8 8 8      8    8 8' 8  8 8oooo8
 b.PY.d' 8.     8 8    . 8    8 8  8  8 8.
  8  8'   Yooo  8  YooP   YooP  8  8  8  Yooo " | lolcat
echo " "
  
date | lolcat
echo ""
