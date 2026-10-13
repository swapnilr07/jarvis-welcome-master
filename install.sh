#!/data/data/com.termux/files/usr/bin/bash

# ====== EDIT THESE ======
NAME="Swapnil"
INSTA="@cyber.techx_07"
GITHUB="swapnilr07"
# ========================

C='\033[38;5;45m'; G='\033[38;5;82m'; Y='\033[38;5;220m'
P='\033[38;5;213m'; D='\033[38;5;240m'; R='\033[38;5;196m'; W='\033[0m'

cd "$(dirname "$0")" || exit 1
LOG="$HOME/install.log"; : > "$LOG"
TOTAL=5; DONE=0
SPIN=(⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏)

# hide cursor + turn OFF line-wrap so the bar can never spill onto a 2nd line
trap 'printf "\033[?7h\033[?25h"' EXIT   # always restore on exit
printf '\033[?25l\033[?7l'

# bar <percent> <icon-color> <icon> <label>
# Width adapts to the terminal so the line never wraps (wrapping = broken bar)
bar() {
  local pct=$1 ic=$2 icon=$3 label=$4
  local cols; cols=$(tput cols 2>/dev/null); [[ $cols =~ ^[0-9]+$ ]] || cols=40
  local width=$(( cols / 3 )); (( width > 24 )) && width=24; (( width < 8 )) && width=8
  local room=$(( cols - width - 14 )); (( room < 0 )) && room=0   # space, bar, space, 4 pct, 2 gap, icon+space, margin
  label="${label:0:room}"
  local i fill="" rest="" f=$(( pct * width / 100 ))
  for ((i=0; i<f; i++)); do fill+="█"; done
  for ((i=f; i<width; i++)); do rest+="░"; done
  printf "\r\033[2K ${G}%s${D}%s${W} ${Y}%3d%%${W}  ${ic}%s${W} ${C}%s${W}" "$fill" "$rest" "$pct" "$icon" "$label"
}

# run_step "Label" command args...
run_step() {
  local label="$1"; shift
  local start=$(( DONE * 100 / TOTAL ))
  local end=$(( (DONE + 1) * 100 / TOTAL ))
  local cur=$start i=0

  "$@" </dev/null >> "$LOG" 2>&1 &
  local pid=$!

  while kill -0 "$pid" 2>/dev/null; do
    (( cur < end - 1 )) && cur=$(( cur + 1 ))
    bar "$cur" "$C" "${SPIN[i++ % 10]}" "$label"
    sleep 0.25
  done

  if wait "$pid"; then
    for ((cur=cur; cur<=end; cur++)); do bar "$cur" "$G" "✔" "$label"; sleep 0.01; done
    DONE=$(( DONE + 1 ))
  else
    printf "\r\033[2K ${R}✘ Failed: %s${W}\n  See log: %s\n" "$label" "$LOG"
    exit 1
  fi
}

row()  { printf "${C}│${W}  ${Y}%s${W} ${D}%-9s${W}  ${P}%-20s${W}${C}│${W}\n" "$1" "$2" "$3"; }

# Replace the Termux bashrc with the Jarvis welcome one
install_bashrc() {
  mkdir -p "$HOME/.jarvis-welcome" \
    && cp terminal.mp3 "$HOME/.jarvis-welcome/terminal.mp3" \
    && rm -f "$PREFIX/etc/bash.bashrc" \
    && cp bash.bashrc "$PREFIX/etc/bash.bashrc"
}

clear
echo
echo -e " ${C}Setting things up, please wait...${W}"
echo

# ====== INSTALL COMMANDS ======
run_step "Updating packages"       pkg update -y
run_step "Installing ruby"         pkg install -y ruby
run_step "Installing mpv"          pkg install -y mpv
run_step "Installing lolcat"       gem install lolcat
run_step "Finalizing setup"        install_bashrc
# ==============================

echo
echo
echo -e " ${G}✔ All done!${W}"
echo
echo -e " ${C}╭─ made by ─────────────────────────╮${W}"
printf  " ${C}│${W}  ${P}%-33s${W}${C}│${W}\n" "$NAME"
echo -n " "; row "◉" "instagram" "$INSTA"
echo -n " "; row "⌥" "github"    "$GITHUB"
echo -e " ${C}╰───────────────────────────────────╯${W}"
echo
echo -e " ${G}Now type 'exit' & restart Termux${W}"
echo
