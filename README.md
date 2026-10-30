# <img src="assets/logo.png" width="36" height="36" align="center"> Penggo's Dotfiles

<p align="center">
  <img src="assets/logo.png" width="120" alt="Logo" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/OS-macOS-000000?style=flat-square&logo=apple&logoColor=white" alt="OS" />
  <img src="https://img.shields.io/badge/Editor-Neovim-57A143?style=flat-square&logo=neovim&logoColor=white" alt="Editor" />
  <img src="https://img.shields.io/badge/Terminal-Ghostty-white?style=flat-square" alt="Terminal" />
  <img src="https://img.shields.io/github/stars/penggo/dotfiles?style=flat-square&color=60a5fa" alt="Stars" />
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square" alt="License" />
</p>

<p align="center">
  <a href="README.md">English</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a>
</p>

My personal macOS development environment — focused on speed, simplicity, and efficiency. Currently includes configurations for **Neovim** and **Ghostty**.

## 📸 Screenshots

| Neovim | Ghostty |
| :---: | :---: |
| ![Neovim Preview](assets/nvim-preview.png) | ![Ghostty Preview](assets/ghostty-preview.png) |

## 🛠 Tools & Configs

- **[Neovim](https://neovim.io/):** A highly customized terminal editor config (written in Lua) designed to deliver an IDE-like experience.
- **[Ghostty](https://ghostty.org/):** Config for the GPU-accelerated modern terminal emulator, with a custom theme and shaders.

## ✨ Key Features

- 🚀 **Blazing Fast Startup**: Optimized LazyVim structure — the editor opens in under a second.
- 💎 **Modern Aesthetics**: Carefully tuned UI elements with smooth scrolling and cursor effects.
- ⌨️ **Efficient Navigation**: A completion engine based on Blink.cmp — instant and precise.
- 🌈 **Syntax Enhancement**: Full Treesitter support for perfect highlighting across languages.
- 🖥️ **GPU Rendering**: Leverages Ghostty's hardware acceleration with custom shaders.
- 🛠️ **One-Shot Setup**: An easy-to-install, easy-to-maintain symlink structure.

## ⚙️ Tech Stack

### [Neovim](https://neovim.io/) (v0.10+)
- **Framework**: [LazyVim](https://www.lazyvim.org/)
- **Completion Engine**: [Blink.cmp](https://github.com/Saghen/blink.cmp) — the next-generation, ultra-fast completion engine.
- **File Tree**: [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- **UI Components**: [Bufferline](https://github.com/akinsho/bufferline.nvim), [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- **Effects**: `smooth-effects` for smooth scrolling.

### [Ghostty](https://ghostty.org/)
- **Terminal Emulator**: GPU-accelerated with excellent performance.
- **Visual Enhancements**: Includes the `in-game-crt-cursor.glsl` custom shader for unique visual feedback.

## 📂 Directory Structure

```text
.
├── nvim/      # Neovim config (~/.config/nvim)
├── vim/       # Basic Vim config (~/.vimrc)
├── ghostty/   # Ghostty terminal config (~/Library/Application Support/com.mitchellh.ghostty)
├── assets/    # Icons and preview screenshots
└── README.md
```

## ⚡️ Installation

> [!WARNING]
> **Warning:** The steps below will overwrite your existing configuration. Back up your own files first!

Clone the repo and map the config files into place with symlinks.

### 1. Clone

```bash
git clone https://github.com/penggo/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Symlinking

You can link things manually with the native commands below:

#### 🔗 Link Neovim & Vim

```bash
# Back up old configs (if any)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
mv ~/.vimrc ~/.vimrc.bak 2>/dev/null || true

# Create symlinks
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```

#### 🔗 Link Ghostty (macOS)

```bash
# Back up and clean up the old config
GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mv "$GHOSTTY_DIR" "${GHOSTTY_DIR}.bak" 2>/dev/null || true

# Create the symlink
ln -s ~/dotfiles/ghostty "$GHOSTTY_DIR"

# Also link it under ~/.config (recommended)
mkdir -p ~/.config/ghostty
ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

## 🤝 Contributing & Feedback

This is my personal setup — highly customized and tied to my own habits. That said, if you spot a bug or have an idea to make it better, Issues and Pull Requests are welcome!

If this setup helps you, a **Star** 🌟 would be much appreciated!

## 📄 License

[MIT License](LICENSE)
