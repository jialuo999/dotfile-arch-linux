# dotfile-arch-linux

[中文版](README_zh.md)

Arch Linux dotfiles backup. Last updated: 2026-07-24.

## Structure

```
home/           # Top-level dotfiles (~/.*)
  .zshrc
  .bashrc
  .gitconfig
  ...

bin/            # Personal scripts (~/bin/)
  fetch_anime.sh
  ff
  fuzzel-hitokoto.sh

config/         # Config directories (~/.config/<name>)
  niri/         # Wayland compositor (Niri)
  kitty/        # Terminal emulator
  nvim/         # Neovim (LazyVim based)
  starship/     # Shell prompt
  fastfetch/    # System info fetcher
  fuzzel/       # Launcher
  btop/         # Resource monitor
  yazi/         # Terminal file manager
  fcitx5/       # Input method (Rime)
  cava/         # Audio visualizer
  mpv/          # Media player
  noctalia/     # Niri bar (noctalia-shell) config & templates
  qt5ct/qt6ct/  # Qt theme config
  gtk-3.0/gtk-4.0/  # GTK theme config
  environment.d/    # Environment variables
  xsettingsd/   # Xsettings daemon
  pacseek/      # Pacman frontend
  yay/          # AUR helper
  fontconfig/   # Font configuration (CJK, aliases)
  dolphinrc     # Dolphin file manager (main fm on Niri)
  qq-flags.conf # QQ Electron wayland flags (env var workaround)
  kglobalshortcutsrc, kdeglobals, ...  # KDE rc files
  mimeapps.list # MIME type associations (Zen/Dolphin as defaults)
  ...
```

## Key Details

- **Compositor**: Niri
- **Shell**: Zsh with Oh-My-Zsh + Starship prompt
- **Niri bar**: noctalia-shell
- **File Manager**: Dolphin (primary on Niri)
- **KDE Plasma Theme**: ChromeOS-dark
- **QQ Wayland**: Electron Ozone env var has no effect on QQ; use `~/.config/qq-flags.conf` to pass `--ozone-platform=wayland` and other flags
- **Zen Browser**: uses noctalia color scheme
- **Font**: ChillRoundM
- **Icons**: Tela
- **Cursor**: cat_cursors (on niri) / hei_cursors (on KDE)
- **Terminal Font**: JetBrainsMonoNLNF-Regular

## Screenshots

### Niri

![Effect 1](pic/effect4.png)

### KDE

![Effect 2](pic/effect2.png)
