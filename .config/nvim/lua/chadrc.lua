-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nord",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  nvdash = {
    load_on_startup = true,
  },
}

M.mason = {
  pkgs = {
    "gopls",
    "gofumpt",
    "goimports",
    "staticcheck",
    "delve",
    "clangd",
    "clang-format",
    "codelldb",
    "rust-analyzer",
    "rustfmt",
  },
}

return M
