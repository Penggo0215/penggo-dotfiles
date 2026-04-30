return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      -- 确保 opts.highlights 存在
      opts.highlights = opts.highlights or {}
      
      -- 将选中的 buffer 样式强制设置为非斜体和非加粗
      opts.highlights.buffer_selected = {
        italic = false,
        bold = false,
      }
      -- 对于有错误/警告等状态的选中 buffer，也强制取消斜体和加粗
      opts.highlights.error_selected = { italic = false, bold = false }
      opts.highlights.warning_selected = { italic = false, bold = false }
      opts.highlights.info_selected = { italic = false, bold = false }
      opts.highlights.hint_selected = { italic = false, bold = false }
      opts.highlights.diagnostic_selected = { italic = false, bold = false }
      opts.highlights.modified_selected = { italic = false, bold = false }
    end,
  },
}