-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 始终保持光标上下有 10 行的距离
vim.opt.scrolloff = 10

-- 开启鼠标支持
vim.opt.mouse = "a"

-- 调整鼠标滚动速度（默认 3，改为 1 配合平滑滚动插件）
vim.opt.mousescroll = "ver:1,hor:1"

-- 降低鼠标悬停触发延迟（默认 4000ms 太久，建议设为 500ms）
vim.opt.updatetime = 500

-- 自定义诊断 (Diagnostics) 显示方式，使界面更清爽

-- 设置背景为暗色模式
vim.opt.background = "dark"
-- 如果在 VSCode (或 Cursor) 中运行，则关闭拼写检查，避免中文下出现波浪线
if vim.g.vscode then
  vim.opt.spell = false
end
