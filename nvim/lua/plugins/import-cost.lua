return {
  {
    "barrett-ruth/import-cost.nvim",
    event = "BufRead",
    init = function()
      -- 新版 import-cost 插件不再需要 require().setup()，而是通过全局变量配置
      vim.g.import_cost = {
        package_manager = "npm", -- 默认使用 npm，你可以改成 yarn, pnpm 或 bun
      }
    end,
  },
}
