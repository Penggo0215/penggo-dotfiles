return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        accept_suggestion = "<M-l>", -- 保持与你之前一致的 Alt+l / Option+l 采纳快捷键
        clear_suggestion = "<M-]>",
        accept_word = "<C-y>",
      },
      color = {
        suggestion = "#808080", -- 灰色虚影提示
      },
    },
  },
}
