# 🤖 Jarvis Welcome

**Give your Termux / Linux terminal a warm, futuristic Jarvis-style welcome.**

![Platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux-blue?style=for-the-badge)
![Shell](https://img.shields.io/badge/shell-bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Maintained](https://img.shields.io/badge/maintained-yes-brightgreen?style=for-the-badge)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-orange?style=for-the-badge)

[Installation](#-installation) •
[Uninstall](#-uninstall) •
[Troubleshooting](#-troubleshooting) •
[FAQ](#-faq) •
[Contributing](#-contributing)


---

## 📑 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
  - [Termux (Android)](#-termux-android)
  - [Linux](#-linux-debian--ubuntu--kali)
- [Usage](#-usage)
- [Uninstall](#-uninstall)
- [Troubleshooting](#-troubleshooting)
- [FAQ](#-faq)
- [Contributing](#-contributing)
- [Disclaimer](#-disclaimer)
- [Connect With Me](#-connect-with-me)

---

## 📖 About

**Jarvis Welcome** greets you every time you open your terminal, turning a plain shell into a personalized, sci-fi style experience. It is lightweight, installs in one command, and can be removed just as easily.

> Repository: <https://github.com/swapnilr07/jarvis-welcome-master>

---

## ✨ Features

- 🎙️ Jarvis-style welcome greeting on terminal start
- 📱 Works on **Termux (Android)** and **Linux**
- ⚡ One-command installation
- 🪶 Lightweight, only needs `git` and `mpv`
- 🧹 Clean uninstall script included

---

## ✅ Requirements

| Requirement | Termux | Linux (Debian / Ubuntu / Kali) |
|-------------|--------|--------------------------------|
| `git` | `pkg install git` | `sudo apt install git` |
| `mpv` | `pkg install mpv` | `sudo apt install mpv` |
| Internet connection | Required for cloning | Required for cloning |

> 💡 **Termux tip:** Install Termux from **[F-Droid](https://f-droid.org/packages/com.termux/)**. The Google Play version is outdated and may fail to install packages.

---

## 🚀 Installation

### 📱 Termux (Android)

**Option 1: Step by step**

```bash
pkg update && pkg upgrade -y
pkg install git mpv -y
git clone https://github.com/swapnilr07/jarvis-welcome-master.git
cd jarvis-welcome-master
chmod +x *
sh install.sh
exit
```

**Option 2: Single command**

```bash
pkg update -y && pkg install git mpv -y && git clone https://github.com/swapnilr07/jarvis-welcome-master.git && cd jarvis-welcome-master && chmod +x * && ./install.sh
```

---

### 🐧 Linux (Debian / Ubuntu / Kali)

**Option 1: Step by step**

```bash
sudo apt update
sudo apt install git mpv -y
git clone https://github.com/swapnilr07/jarvis-welcome-master.git
cd jarvis-welcome-master
chmod +x *
bash install.sh
exit
```

**Option 2: Single command**

```bash
sudo apt update && sudo apt install git mpv -y && git clone https://github.com/swapnilr07/jarvis-welcome-master.git && cd jarvis-welcome-master && chmod +x * && bash install.sh
```

> Using another distro? Install `git` and `mpv` with your package manager (`dnf`, `pacman`, `zypper`, ...), then follow the same clone and install steps.

---

## 🎮 Usage

1. Complete the installation above.
2. Type `exit` to close the terminal session.
3. Open Termux (or your Linux terminal) again.
4. Enjoy your welcome. 🎉

> 🔊 Turn your media volume up. The greeting plays through `mpv`.

---

## 🗑️ Uninstall

```bash
cd jarvis-welcome-master
bash rvt.sh
```

Then close and reopen your terminal. To delete the downloaded folder as well:

```bash
cd ..
rm -rf jarvis-welcome-master
```

---

## 🛠️ Troubleshooting

| Problem | Solution |
|---------|----------|
| `Permission denied` when running a script | Run `chmod +x *` inside the project folder |
| `git: command not found` | Install git: `pkg install git` (Termux) or `sudo apt install git` (Linux) |
| `mpv: command not found` or no sound | Install mpv: `pkg install mpv` (Termux) or `sudo apt install mpv` (Linux) |
| `No such file or directory` after cloning | Make sure you ran `cd jarvis-welcome-master` |
| Welcome doesn't appear | Type `exit`, then fully close and reopen the terminal |
| Package errors in Termux | Run `pkg update && pkg upgrade -y`, or reinstall Termux from F-Droid |
| `fatal: destination path already exists` | Delete the old folder with `rm -rf jarvis-welcome-master` and clone again |

---

## ❓ FAQ

**Does it work on non-rooted Android phones?**
Yes. Termux does not need root.

**Does it work on Windows or macOS?**
Not officially. It targets Termux and Linux. Windows users can try WSL.

**How do I update to the latest version?**
Uninstall with `bash rvt.sh`, delete the folder, then clone and install again.

**Is it safe?**
Review `install.sh` before running it. You should do this with any script you download from the internet.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome.

1. Fork this repository
2. Create a branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "Add my feature"`
4. Push the branch: `git push origin feature/my-feature`
5. Open a Pull Request

Found a bug? [Open an issue](https://github.com/swapnilr07/jarvis-welcome-master/issues).

---

## ⚠️ Disclaimer

This project is made for fun and personalization. It is provided "as is", without warranty of any kind. Use it at your own risk.

---

## 📬 Connect With Me


[![YouTube](https://img.shields.io/badge/YouTube-@technologysr07-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@technologysr07)
[![Instagram](https://img.shields.io/badge/Instagram-@cyber.techx__07-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/cyber.techx_07)

⭐ **If you like this project, please give it a star!** ⭐