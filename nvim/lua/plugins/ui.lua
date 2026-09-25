return {
  -- 修复偶尔无法输入的问题：将 noice 的 cmdline 视图改为底部经典样式
  -- 避免完全禁用 cmdline 模块导致与其他插件（如 snacks.picker）的兼容性问题
  -- 这保留了 noice 的功能，但避免了浮窗导致的焦点丢失或输入锁定
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline", -- 使用经典底部命令行视图
      },
      lsp = {
        signature = {
          enabled = false, -- 禁用 noice 的签名帮助，改用 blink.cmp 的
        },
      },
    },
  },

  -- 在状态栏显示文件大小，极简风格：去掉所有分隔符箭头
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- 插入文件大小组件
      table.insert(opts.sections.lualine_x, 1, "filesize")

      -- 极简：完全去掉分隔符，靠区块背景色自然过渡
      -- 每个组件自带 padding 间距，所以不额外加分隔符也很清晰
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }

      -- 右下角时钟：右侧 padding 防止贴边
      opts.sections.lualine_z = {
        {
          function()
            return " " .. os.date("%R")
          end,
          padding = { left = 1, right = 2 },
        },
      }
    end,
  },
}
