---
updated: 2026-03-16T04:56:17.00Z
---

# Dotfiles

This repository contains my personal dotfiles, scripts, and configuration
setups that define my Linux development environment, productivity tools, and
desktop workflows. The goal is to have a **fully reproducible, aesthetic, and
highly efficient setup** for coding, note-taking, and daily system usage.

---

## Screenshots

![Niri Desktop](./assets/images/niri-desktop.jpg)

---

## ![Niri Workspaces](./assets/images/niri-workspaces-canvas.jpg)

---

![Niri Workspace](./assets/images/niri-workspaces.jpg)

---

![Dank Material Shell Overview](./assets/images/shell-dank-material-shell-overview.jpg)

---

![Dank Material Shell Weather](./assets/images/shell-dank-material-shell-weather.jpg)

---

![Dank Material Shell System Controls](./assets/images/shell-dank-material-shell-controlls.jpg)

---

![Dank Material Shell System Wallpaper](./assets/images/shell-dank-material-shell-wallpaper.jpg)

---

![Obsidian For Notes](./assets/images/apps-obsidian-note.jpg)

---

![Obsidian MindMap](./assets/images/apps-obsidian-note.jpg)

---

![Dank Material Shell System Wallpaper](./assets/images/apps-obsidian-mindmap.jpg)

---

![OnlyOffice](./assets/images/apps-only-office.jpg)

---

![Docker](./assets/images/cli-lazydocker.jpg)

---

![Neovim Editor](./assets/images/neovim-configs-jagervim.jpg)

---

![Neovim Editor](./assets/images/neovim-configs-1.jpg)

---

![Presentation using Markdown](./assets/images/cli-present-markdown-in-slides.jpg)

---

![Niri Keybindings Helper Script](./assets/images/script-niri-keybinds.jpg)

---

![Quickly Search Browser History in All installed Browsers](./assets/images/script-searchable-multi-browsers-history.jpg)

---

## Directory Structure

## Requirements

Ensure that you have the following tools installed:

### Git

```bash
pacman -S git
```

### Stow

```bash
pacman -S stow
```

---

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```bash
git clone git@github.com/sirjager/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```bash
stow .
```
