return {
  -- 彻底禁用 Tailwind CSS LSP 的颜色预览装饰 (这是导致色块显示的根本原因)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              colorDecorators = false,
            },
          },
        },
      },
    },
  },

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

  -- 在状态栏显示文件大小，并将大箭头替换为小箭头
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- 插入文件大小组件
      table.insert(opts.sections.lualine_x, 1, "filesize")

      -- 使用小巧的箭头（Nerd Fonts）替换巨大的默认箭头
      -- 为右侧的箭头添加一个空格，防止它和文字挤在一起导致显示异常
      opts.options.section_separators = { left = "", right = " " }
      opts.options.component_separators = { left = "", right = " " }
    end,
  },
}
