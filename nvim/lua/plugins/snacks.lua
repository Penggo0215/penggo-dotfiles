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
    notifier = {
      enabled = true,
      timeout = 3000, -- 消息停留 3 秒自动消失
      width = { min = 40, max = 0.4 }, -- 最小 40 字符宽，最大占屏幕 40%
      style = "fancy", -- 使用更华丽的“花式”渲染风格
      top_down = true, -- 从上往下排列
      margin = { top = 1, right = 1, bottom = 0 }, -- 离屏幕边缘留一点呼吸空间
    },
    -- 启用仪表盘 (启动页)
    dashboard = {
      preset = {
        header = [[
 ██████╗ ███████╗███╗   ██╗ ██████╗  ██████╗  ██████╗ 
 ██╔══██╗██╔════╝████╗  ██║██╔════╝ ██╔════╝ ██╔═══██╗
 ██████╔╝█████╗  ██╔██╗ ██║██║  ███╗██║  ███╗██║   ██║
 ██╔═══╝ ██╔══╝  ██║╚██╗██║██║   ██║██║   ██║██║   ██║
 ██║     ███████╗██║ ╚████║╚██████╔╝╚██████╔╝╚██████╔╝
 ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝  ╚═════╝ 
        ]],
      },
    },
    -- 启用窗口动画
    animate = { enabled = true },
    -- 启用平滑滚动，调整参数以鼓励大跳转动画
    scroll = { 
      enabled = true,
      animate = {
        duration = { step = 15, total = 300 }, -- 增加 step 和 total 时间
      },
    },
    -- 启用并配置浮窗终端
    terminal = {
      win = {
        position = "float", -- 强制使用浮窗位置
        border = "rounded", -- 恢复圆角边框，这是保持边缘平滑的关键
        width = 0.85,
        height = 0.8,
        backdrop = 60,      -- 恢复适中的暗化效果
        wo = {
          -- 将边框的颜色与背景色 (NormalFloat) 融合，或者使用一个极暗的颜色来弱化线条感
          winhighlight = "NormalFloat:Normal,FloatBorder:NormalFloat", 
        },
        keys = {
          -- 允许使用 ESC 退出终端插入模式
          term_normal = {
            "<esc>",
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd("stopinsert")
              else
                self.esc_timer:start(200, 0, function() end)
                return "<esc>"
              end
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
        },
      },
    },
    -- 启用缩进线
    indent = { enabled = true },
    -- 启用当前作用域高亮
    scope = { enabled = true },
  },
  keys = {
    -- Snacks Picker 常用快捷键
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    -- 浮窗终端快捷键
    { "<leader>tt", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Terminal" },
  },
}
