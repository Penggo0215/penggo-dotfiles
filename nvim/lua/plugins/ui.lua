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

  -- 在状态栏显示文件大小 (filesize)
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, "filesize")
    end,
  },
}
