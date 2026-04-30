return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 启用 basedpyright 并降低其类型检查的严格程度
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "off", -- 彻底关闭类型检查，消除所有报错红线
                diagnosticSeverityOverrides = {
                  -- 保持这些为 none 作为双重保险
                  reportUnknownVariableType = "none",
                  reportUnknownArgumentType = "none",
                  reportUnknownParameterType = "none",
                  reportUnknownMemberType = "none",
                  reportMissingTypeStubs = "none",
                  reportAny = "none",
                  reportMissingImports = "none",
                  reportMissingModuleSource = "none",
                },
              },
            },
          },
        },
        -- 禁用微软原版的 pyright
        pyright = { enabled = false },
        -- 保持 ruff 开启
        ruff = { enabled = true },
      },
    },
  },
}