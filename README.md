# dotfile-arch-linux

Arch Linux dotfiles backup. Last updated: 2026-06-20.
Arch Linux dotfiles 备份。最近更新：2026-06-20。

## Structure / 目录结构

```
home/           # Top-level dotfiles (~/.*) / 顶级 dotfiles (~/.*)
  .zshrc
  .bashrc
  .gitconfig
  ...

bin/            # Personal scripts (~/bin/) / 个人脚本 (~/bin/)
  fetch_anime.sh
  ff
  fuzzel-hitokoto.sh

config/         # Config directories (~/.config/<name>) / 配置目录 (~/.config/<name>)
  niri/         # Wayland compositor (Niri) / Wayland 合成器 (Niri)
  kitty/        # Terminal emulator / 终端模拟器
  nvim/         # Neovim (LazyVim based) / Neovim (基于 LazyVim)
  starship/     # Shell prompt / Shell 提示符
  fastfetch/    # System info fetcher / 系统信息工具
  fuzzel/       # Launcher / 启动器
  btop/         # Resource monitor / 资源监控器
  yazi/         # Terminal file manager / 终端文件管理器
  fcitx5/       # Input method (Rime) / 输入法 (Rime)
  cava/         # Audio visualizer / 音频可视化
  mpv/          # Media player / 媒体播放器
  noctalia/     # Niri bar (noctalia-shell) config & templates / Niri 状态栏配置与模板
  qt5ct/qt6ct/  # Qt theme config / Qt 主题配置
  gtk-3.0/gtk-4.0/  # GTK theme config / GTK 主题配置
  environment.d/    # Environment variables / 环境变量
  xsettingsd/   # Xsettings daemon / Xsettings 守护进程
  pacseek/      # Pacman frontend / Pacman 前端
  yay/          # AUR helper / AUR 助手
  fontconfig/   # Font configuration (CJK, aliases) / 字体配置 (CJK, 别名)
  qq-flags.conf # QQ Electron wayland flags (env var workaround) / QQ Electron wayland 参数 (环境变量失效的替代方案)
  ...
```

## Key Details / 关键配置

- **Compositor / 合成器**: Niri
- **Shell**: Zsh with Oh-My-Zsh + Starship prompt / Zsh + Oh-My-Zsh + Starship
- **Niri bar / 状态栏**: noctalia-shell
- **KDE Plasma Theme / KDE Plasma 主题**: ChromeOS-dark
- **QQ Wayland**: Electron Ozone env var has no effect on QQ; use `~/.config/qq-flags.conf` to pass `--ozone-platform=wayland` and other flags / Electron Ozone 环境变量对 QQ 失效，改用 `~/.config/qq-flags.conf` 传入 `--ozone-platform=wayland` 等参数
- **Font / 字体**: ChillRoundM
- **Icons / 图标**: Tela
- **Cursor / 光标**: cat_cursors (on niri) / hei_cursors (on KDE)
- **Terminal Font / 终端字体**: JetBrainsMonoNLNF-Regular

## Screenshots / 截图

### Niri

![Effect 1](pic/effect1.png)

### KDE

![Effect 2](pic/effect2.png)
