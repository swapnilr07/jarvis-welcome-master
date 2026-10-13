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

trap 'printf "\033[?25h"' EXIT          # always restore cursor
printf '\033[?25l'                       # hide cursor

# bar <percent> <label>
bar() {
  local pct=$1 label=$2 width=30 i fill="" rest=""
  local f=$(( pct * width / 100 )) e=$(( width - pct * width / 100 ))
  for ((i=0; i<f; i++)); do fill+="█"; done
  for ((i=0; i<e; i++)); do rest+="░"; done
  printf "\r\033[K ${G}%s${D}%s${W} ${Y}%3d%%${W}  ${C}%b${W}" "$fill" "$rest" "$pct" "$label"
}

# run_step "Label" command args...
run_step() {
  local label="$1"; shift
  local start=$(( DONE * 100 / TOTAL ))
  local end=$(( (DONE + 1) * 100 / TOTAL ))
  local cur=$start i=0

  "$@" >> "$LOG" 2>&1 &
  local pid=$!

  while kill -0 "$pid" 2>/dev/null; do
    (( cur < end - 1 )) && cur=$(( cur + 1 ))
    bar "$cur" "${SPIN[i++ % 10]} $label"
    sleep 0.25
  done

  if wait "$pid"; then
    for ((cur=cur; cur<=end; cur++)); do bar "$cur" "${G}✔${C} $label"; sleep 0.01; done
    DONE=$(( DONE + 1 ))
  else
    printf "\r\033[K ${R}✘ Failed: %s${W}\n  See log: %s\n" "$label" "$LOG"
    exit 1
  fi
}

row()  { printf "${C}│${W}  ${Y}%s${W} ${D}%-9s${W}  ${P}%-20s${W}${C}│${W}\n" "$1" "$2" "$3"; }

# Replace the Termux bashrc with the Jarvis welcome one
install_bashrc() {
  rm -f "$PREFIX/etc/bash.bashrc" && cp bash.bashrc "$PREFIX/etc/bash.bashrc"
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
