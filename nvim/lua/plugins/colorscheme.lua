return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "medium",
      transparent_mode = false,
      italic = {
        strings = false,
        comments = false,
        emphasis = false,
        folds = false,
        operators = false,
      },
      overrides = {
        -- ==========================================
        -- 1. 基础环境 (Matches Cursor Background/Foreground)
        -- ==========================================
        Normal = { bg = "#282828", fg = "#ebdbb2" },
        NormalFloat = { bg = "#282828", fg = "#ebdbb2" },
        
        -- ==========================================
        -- 2. 颜色映射 (Based on Cursor Screenshots)
        -- ==========================================
        
        -- 红色 (#fb4934): 所有的关键字、引入、逻辑词
        Keyword = { fg = "#fb4934", italic = false },
        Statement = { fg = "#fb4934" },
        Conditional = { fg = "#fb4934" },
        Repeat = { fg = "#fb4934" },
        Include = { fg = "#fb4934" },
        ["@keyword"] = { fg = "#fb4934", italic = false },
        ["@keyword.operator"] = { fg = "#fb4934" }, -- and, or, not, in
        ["@keyword.import"] = { fg = "#fb4934" },
        ["@keyword.function"] = { fg = "#fb4934" },
        ["@keyword.return"] = { fg = "#fb4934" },

        -- 黄色 (#fabd2f): 类名、类型名、模块名、导入的对象名
        Type = { fg = "#fabd2f" },
        ["@type"] = { fg = "#fabd2f" },
        ["@class"] = { fg = "#fabd2f" },
        ["@constructor"] = { fg = "#fabd2f" },
        ["@module"] = { fg = "#fabd2f" },
        ["@namespace"] = { fg = "#fabd2f" },
        ["@type.builtin"] = { fg = "#fabd2f" },

        -- 青色 (#8ec07c): 函数调用、方法调用、操作符、标签
        Function = { fg = "#8ec07c" },
        Operator = { fg = "#8ec07c" },
        ["@function"] = { fg = "#8ec07c" },
        ["@function.call"] = { fg = "#8ec07c" },
        ["@method"] = { fg = "#8ec07c" },
        ["@method.call"] = { fg = "#8ec07c" },
        ["@operator"] = { fg = "#8ec07c" },
        ["@tag"] = { fg = "#8ec07c" },
        ["@tag.builtin"] = { fg = "#8ec07c" },

        -- 橙色 (#fe8019): 特殊符号如箭头函数 =>
        ["@punctuation.special"] = { fg = "#fe8019" },
        
        -- 白色 (#ebdbb2): 普通变量、常量 (全大写)
        Identifier = { fg = "#ebdbb2" },
        ["@variable"] = { fg = "#ebdbb2" },
        ["@constant"] = { fg = "#ebdbb2" },
        ["@lsp.type.variable"] = { fg = "#ebdbb2" },
        ["@lsp.typemod.variable.readonly"] = { fg = "#ebdbb2" },

        -- 蓝灰色 (#83a598): 参数、属性、成员、对象键名
        ["@variable.parameter"] = { fg = "#83a598" },
        ["@property"] = { fg = "#83a598" }, -- 对象属性如 display, position
        ["@field"] = { fg = "#83a598" },
        ["@variable.member"] = { fg = "#83a598" },
        ["@tag.delimiter"] = { fg = "#83a598" }, -- < 和 >
        ["@lsp.type.parameter"] = { fg = "#83a598" },
        ["@lsp.type.property"] = { fg = "#83a598" },

        -- 其它
        Comment = { fg = "#928374", italic = false },
        String = { fg = "#b8bb26" },
        Number = { fg = "#d3869b" },
        Boolean = { fg = "#d3869b" },
        ["@punctuation.bracket"] = { fg = "#d5c4a1" },
        ["@punctuation.delimiter"] = { fg = "#a89984" },

        -- UI
        Visual = { bg = "#689d6a", fg = "#ebdbb2" },
        CursorLine = { bg = "#3c3836" },
        LineNr = { fg = "#665c54" },
        CursorLineNr = { fg = "#fabd2f" },
        MatchParen = { bg = "#928374", fg = "#ebdbb2", bold = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
