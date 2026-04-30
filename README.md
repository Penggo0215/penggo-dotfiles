# <img src="assets/ghostty-icon.png" width="36" height="36" align="center"> Penggo's Dotfiles

<p align="center">
  <img src="https://img.shields.io/badge/OS-macOS-000000?style=flat-square&logo=apple&logoColor=white" alt="OS" />
  <img src="https://img.shields.io/badge/Editor-Neovim-57A143?style=flat-square&logo=neovim&logoColor=white" alt="Editor" />
  <img src="https://img.shields.io/badge/Terminal-Ghostty-white?style=flat-square" alt="Terminal" />
  <img src="https://img.shields.io/github/stars/penggo/dotfiles?style=flat-square&color=60a5fa" alt="Stars" />
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square" alt="License" />
</p>

我的个人 macOS 开发环境配置，主打极速、简洁与高效。目前主要包含 **Neovim** 和 **Ghostty** 的配置。

## 📸 效果预览 (Screenshots)

| Neovim | Ghostty |
| :---: | :---: |
| ![Neovim Preview](assets/nvim-preview.png) | ![Ghostty Preview](assets/ghostty-preview.png) |

## 🛠 包含的工具与配置

- **[Neovim](https://neovim.io/):** 高度定制的终端编辑器配置（使用 Lua 编写），旨在提供类似 IDE 的体验。
- **[Ghostty](https://ghostty.org/):** GPU 加速的现代终端模拟器配置，包含自定义主题与着色器（Shaders）。

## ✨ 核心特性 (Key Features)

- 🚀 **极速启动**: 优化的 LazyVim 结构，秒开编辑器。
- 💎 **现代美学**: 细致调整的 UI 元素，支持平滑滚动与光标特效。
- ⌨️ **高效导航**: 基于 Blink.cmp 的补全引擎，极速且精准。
- 🌈 **语法增强**: 完整的 Treesitter 支持，为各种语言提供完美的着色。
- 🖥️ **GPU 渲染**: 利用 Ghostty 的硬件加速能力，配合自定义着色器（Shaders）。
- 🛠️ **一键配置**: 易于安装与维护的软链接结构。

## ⚙️ 技术栈 (Tech Stack)

### [Neovim](https://neovim.io/) (v0.10+)
- **基础框架**: [LazyVim](https://www.lazyvim.org/)
- **补全引擎**: [Blink.cmp](https://github.com/Saghen/blink.cmp) - 新一代极速补全。
- **文件树**: [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- **UI 组件**: [Bufferline](https://github.com/akinsho/bufferline.nvim), [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- **特效**: `smooth-effects` 支持平滑滚动效果。

### [Ghostty](https://ghostty.org/)
- **终端模拟器**: GPU 加速，性能卓越。
- **视觉增强**: 包含 `in-game-crt-cursor.glsl` 自定义着色器，提供独特的视觉反馈。

## 📂 目录结构

```text
.
├── nvim/      # Neovim 配置文件 (~/.config/nvim)
├── ghostty/   # Ghostty 终端配置 (~/Library/Application Support/com.mitchellh.ghostty)
├── assets/    # 图标与预览图截图存放目录
└── README.md
```

## ⚡️ 快速安装 (Installation)

> [!WARNING]  
> **警告：** 以下脚本将会覆盖你现有的配置，请在执行前备份自己的文件！

你可以通过 `git clone` 下载仓库，并使用软链接（Symlinks）将配置文件映射到系统中。

### 1. 克隆仓库

```bash
git clone https://github.com/penggo/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. 建立软链接 (Symlinking)

你可以使用以下原生命令手动链接：

#### 🔗 链接 Neovim

```bash
# 备份旧配置 (如果存在)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# 创建软链接
ln -s ~/dotfiles/nvim ~/.config/nvim
```

#### 🔗 链接 Ghostty (macOS)

```bash
# 备份并清理旧配置
GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mv "$GHOSTTY_DIR" "${GHOSTTY_DIR}.bak" 2>/dev/null || true

# 创建软链接
ln -s ~/dotfiles/ghostty "$GHOSTTY_DIR"

# 推荐同时在 ~/.config 下也做一个链接
mkdir -p ~/.config/ghostty
ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

## 🤝 贡献与反馈

这是我的个人配置，可能高度定制化并绑定了我的个人习惯。不过，如果你发现了 bug 或者有让它变得更好的建议，欢迎提交 Issues 或 Pull Requests！

如果你觉得这套配置对你有帮助，欢迎点个 **Star** 🌟 鼓励一下！

## 📄 License

[MIT License](LICENSE)
