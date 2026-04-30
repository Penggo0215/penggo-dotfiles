return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "medium",
      italic = {
        strings = false,
        comments = false,
        emphasis = false,
        folds = false,
      },
      overrides = {
        -- 基础语法
        Comment = { fg = "#928374", italic = false },
        ["@comment"] = { fg = "#928374", italic = false },
        ["@comment.documentation"] = { fg = "#928374", italic = false },
        ["@comment.todo"] = { fg = "#928374", italic = false },
        ["@comment.note"] = { fg = "#928374", italic = false },

        Function = { fg = "#8ec07c" },
        Type = { fg = "#fabd2f" },
        Constant = { fg = "#d3869b" },
        String = { fg = "#b8bb26" },
        Identifier = { fg = "#ebdbb2" },
        Keyword = { fg = "#fb4934", italic = false },
        Operator = { fg = "#8ec07c" },
        Punctuation = { fg = "#a89984" },

        -- Tree-sitter 深度同步
        ["@variable"] = { fg = "#ebdbb2" },
        ["@variable.parameter"] = { fg = "#83a598", italic = false },
        ["@variable.builtin"] = { fg = "#d3869b" },
        ["@property"] = { fg = "#83a598" },
        ["@field"] = { fg = "#83a598" },
        ["@constructor"] = { fg = "#8ec07c" },
        ["@method"] = { fg = "#689d6a" },
        ["@function.builtin"] = { fg = "#fe8019" },
        ["@keyword.operator"] = { fg = "#8ec07c" },
        ["@punctuation.bracket"] = { fg = "#a89984" },
        ["@punctuation.delimiter"] = { fg = "#a89984" },
        ["@type.builtin"] = { fg = "#fabd2f" },
        ["@tag"] = { fg = "#8ec07c" },
        ["@tag.attribute"] = { fg = "#fabd2f" },
        ["@tag.delimiter"] = { fg = "#83a598" },

        -- UI 元素同步
        Visual = { bg = "#486249" },
        CursorLine = { bg = "#3c3836" },
        LineNr = { fg = "#665c54" },
        CursorLineNr = { fg = "#fabd2f" },
        MatchParen = { bg = "#928374" },

        FloatBorder = { fg = "#3c3836" },
        VertSplit = { fg = "#3c3836" },
        WinSeparator = { fg = "#3c3836" },

        -- 移除诊断背景色块
        DiagnosticVirtualTextError = { bg = "NONE" },
        DiagnosticVirtualTextWarn = { bg = "NONE" },
        DiagnosticVirtualTextInfo = { bg = "NONE" },
        DiagnosticVirtualTextHint = { bg = "NONE" },
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

