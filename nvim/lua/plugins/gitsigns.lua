return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- 开启当前行 git blame 提示 (类似 VSCode GitLens)
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "   <author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },
}
