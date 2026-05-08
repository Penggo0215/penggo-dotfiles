return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 启用图片模块，替代之前的 image.nvim
    image = {
      enabled = true,
      doc = {
        inline = true, -- 在 markdown 等文档中内联显示图片
        float = true,  -- 支持浮窗显示图片
      },
    },
    -- 启用极速选择器 (可以替代 telescope/fzf)
    picker = { enabled = true },
    -- 启用漂亮的通知系统
    notifier = { enabled = true },
    -- 启用仪表盘 (启动页)
    dashboard = { enabled = true },
    -- 启用平滑滚动
    scroll = { enabled = true },
  },
  keys = {
    -- Snacks Picker 常用快捷键
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
  },
}
