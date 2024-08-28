local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  default_settings = {
    -- rust-analyzer language server configuration
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        buildScripts = {
          enable = true,
        },
      },
      -- Add clippy lints for Rust.
      checkOnSave = true,
      procMacro = {
        enable = true,
      },
    },
  },
}
