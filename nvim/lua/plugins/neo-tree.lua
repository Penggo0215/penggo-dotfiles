return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- 当设置为 true 时，符合过滤规则的文件也将显示（通常是半透明）。
        hide_dotfiles = false, -- 不隐藏以 . 开头的文件
        hide_gitignored = false, -- 不隐藏被 .gitignore 忽略的文件
        hide_by_name = {
          -- ".DS_Store",
          -- "thumbs.db",
          -- "node_modules",
        },
        hide_by_pattern = {
          -- "*.meta",
        },
        always_show = { -- 强制显示的列表
          ".env",
          ".env.development",
          ".env.production",
          ".env.stage",
          ".env.local",
          ".gitignore",
        },
        never_show = {}, -- 确保没有被禁止显示的文件
      },
      follow_current_file = {
        enabled = true,
      },
    },
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "│",
        indent_size = 2,
        padding = 1,
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        default = "󰈚",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "󰁕",
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
    },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = "none",
      },
    },
  },
}
