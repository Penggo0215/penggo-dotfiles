-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 一键保存并运行 Python (下方拆分窗口)
vim.keymap.set("n", "<leader>pr", function()
  vim.cmd("w")
  vim.cmd("botright 10split")
  vim.cmd("term python3 " .. vim.fn.expand("%"))
  vim.opt_local.buflisted = false
end, { desc = "Run Python" })

-- 一键复制当前行报错
vim.keymap.set("n", "<leader>cy", function()
  local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if #line_diagnostics > 0 then
    local messages = {}
    for _, d in ipairs(line_diagnostics) do
      table.insert(messages, d.message)
    end
    local content = table.concat(messages, "\n")
    vim.fn.setreg("+", content)
    vim.notify("已复制报错信息到剪贴板")
  else
    vim.notify("当前行没有报错信息")
  end
end, { desc = "Copy current line error" })

-- 使用 H 和 L 快速跳转行首行尾
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "跳转到行首非空字符" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "跳转到行尾" })

-- 方案一优化：将 d 和 c 彻底改为纯删除和纯修改（不污染剪贴板）
vim.keymap.set({ "n", "v" }, "d", [["_d]], { desc = "纯删除" })
vim.keymap.set({ "n", "v" }, "D", [["_D]], { desc = "纯删至行尾" })
vim.keymap.set({ "n", "v" }, "c", [["_c]], { desc = "纯修改" })
vim.keymap.set({ "n", "v" }, "C", [["_C]], { desc = "纯修改至行尾" })

-- 将 x 键分配为“剪切” (代替原生的 d)
vim.keymap.set({ "n", "v" }, "x", "d", { desc = "剪切" })
vim.keymap.set("n", "xx", "dd", { desc = "剪切当前行" })
vim.keymap.set("n", "X", "D", { desc = "剪切至行尾" })

-- 插入模式下连按 jj 快速进入 Normal 模式
vim.keymap.set("i", "jj", "<esc>", { desc = "退出插入模式" })

-- 更多效率优化
vim.keymap.set("v", "p", '"_dP', { desc = "粘贴不覆盖剪贴板" })
vim.keymap.set("v", "<", "<gv", { desc = "连续缩进 (左)" })
vim.keymap.set("v", ">", ">gv", { desc = "连续缩进 (右)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "搜索居中" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "搜索居中" })
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "清除高亮" })
