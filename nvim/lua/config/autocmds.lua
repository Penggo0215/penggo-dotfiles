-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 保持背景色与终端一致 (透明背景)
local function set_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "EndOfBuffer",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "FoldColumn",
    "Folded",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
  end

  -- 调亮看不清的次要文本（针对 Monokai 透明背景优化）
  -- 调亮 Telescope 中的目录路径和次要信息 (全面覆盖)
  local telescope_groups = {
    "TelescopeResultsDirectory",
    "TelescopeResultsNormal",
    "TelescopeResultsComment",
    "TelescopeResultsSpecial",
    "TelescopeResultsVariable",
    "TelescopePathSeparator",
  }
  for _, group in ipairs(telescope_groups) do
    vim.api.nvim_set_hl(0, group, { fg = "#bbbbbb", italic = false }) -- 使用更亮的浅灰色，取消斜体
  end

  -- 调亮文件名 (如果也觉得暗)
  vim.api.nvim_set_hl(0, "TelescopeResultsFile", { fg = "#eeeeee", italic = false })

  -- 调亮注释和特殊非文本字符
  vim.api.nvim_set_hl(0, "Comment", { fg = "#aaaaaa", italic = false })
  vim.api.nvim_set_hl(0, "NonText", { fg = "#888888" })
  -- 调亮边框（如果觉得太暗）
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#666666" })
  -- 调亮 Neo-tree 的路径
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#aaaaaa", italic = false })
  vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#ffffff", bold = true, italic = false })

  -- 调亮代码中的 Inlay Hints (行内类型提示/参数名)
  vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#777777", bg = "none" }) -- 调亮并去掉可能的背景色
end

-- 初始加载时应用
set_transparent()

-- 切换配色时重新应用
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_transparent,
})
