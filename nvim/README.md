# Nvim Config

基于 [LazyVim](https://github.com/LazyVim/LazyVim)，在 `lua/config/` 和 `lua/plugins/` 中做了个人化定制。

## 关键定制点

- **配色**：gruvbox，针对 Cursor 配色方案手动映射了 treesitter/LSP 高亮组（`plugins/colorscheme.lua`），透明背景通过 `config/autocmds.lua` 的 `ColorScheme` 回调统一处理。
- **补全**：blink.cmp + supermaven-nvim（AI 代码补全）。
- **查找/选择器**：snacks.picker（未使用 telescope/fzf），`<leader><space>`/`<leader>ff`/`<leader>fg` 由 `plugins/snacks.lua` 手动提供。
- **文件树**：neo-tree，显示 dotfiles 及 `.env*`。
- **LSP**：统一在 `plugins/lsp.lua` 配置（Python 走 basedpyright + ruff，关闭原版 pyright；Tailwind 关闭颜色装饰器）。
- **Git**：gitsigns（开启 current line blame）。
- **调试**：dap.core / lang.python 等 LazyVim extras，见 `config/lazy.lua`。

## 安装

参考 [LazyVim 官方文档](https://lazyvim.github.io/installation)。
