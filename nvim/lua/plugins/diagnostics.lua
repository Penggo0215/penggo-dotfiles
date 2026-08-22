return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- 必须在其他插件之前加载，确保能覆盖默认的 virtual_text 渲染
    opts = {
      preset = "modern",
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      -- 关闭默认的行内诊断文字，交给 tiny-inline-diagnostic 渲染
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
