return {
  -- 使用官方最稳定的原版 codeium 插件
  {
    "Exafunction/codeium.vim",
    -- 移除延迟加载，确保打开编辑器时命令立即可用
    lazy = false,
    config = function()
      -- 设置快捷键
      vim.g.codeium_no_map_tab = false 
    end,
  },
}
