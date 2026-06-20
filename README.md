# dotfile-arch-linux

Arch Linux dotfiles backup. Last updated: 2026-06-19.

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
  Kvantum/      # Qt/Kvantum themes
  qt5ct/qt6ct/  # Qt theme config
  gtk-3.0/gtk-4.0/  # GTK theme config
  environment.d/    # Environment variables
  xsettingsd/   # Xsettings daemon
  pacseek/      # Pacman frontend
  yay/          # AUR helper
  ...

## Key Details

- **Compositor**: Niri (scrollable-tiling Wayland compositor)
- **Shell**: Zsh with Oh-My-Zsh + Starship prompt
- **Input**: Fcitx5 + Rime (Chinese input)
- **DE/Theme**: KDE Plasma + Kvantum + adw-gtk3
- **Font**: ChillRoundM
- **Icons**: Tela
- **Cursor**: hei_cursors

## Screenshots

![Effect 1](pic/effect1.png)
