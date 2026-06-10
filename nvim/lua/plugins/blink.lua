return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- 极致精简：限制显示的条目数量
        list = {
          max_items = 10,
        },
        -- 菜单外观优化
        menu = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          -- 优化布局：[图标] [标签] [描述]
          draw = {
            columns = {
              { "kind_icon", gap = 1 },
              { "label", "label_description", gap = 1 },
            },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  return ctx.kind_icon .. " "
                end,
              },
              label = {
                width = { fill = true },
              },
              label_description = {
                width = { max = 20 }, -- 限制描述最大宽度，防止界面过宽
                highlight = "BlinkCmpLabelDescription",
              },
            },
          },
        },
        -- 文档浮窗：统一圆角风格
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
          },
        },
        -- 虚影预览
        ghost_text = {
          enabled = true,
        },
      },
      -- 增加签名帮助支持，参考 VS Code 样式
      signature = {
        enabled = true,
        window = {
          border = "rounded",
          max_height = 8,
          max_width = 60,
          winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        },
      },
      -- 优化源优先级，确保 LSP 和 Snippets 更有序
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = { score_offset = 4 },
          snippets = { score_offset = 3 },
          buffer = { score_offset = 1, min_keyword_length = 4 }, -- buffer 提示至少 4 个字符才触发，减少干扰
        },
      },
    },
  },
}
