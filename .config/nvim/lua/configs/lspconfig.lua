-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c" },
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = false,
    completeUnimported = true,
    clangdFileStatus = true,
  },
}

-- golang
lspconfig.gopls.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      staticcheck = true,
      analyses = {
        fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
    },
  },
}
