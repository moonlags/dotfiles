return {
  -- formating
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.nvim-dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "configs.nvim-dap-ui"
    end,
  },
  { "nvim-neotest/nvim-nio" },

  -- golang
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    config = function()
      vim.keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "GOLANG Add json struct tags" })
      vim.keymap.set("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "GOLANG Add yaml struct tags" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "htmx-lsp",
        "gopls",
        "gofumpt",
        "goimports",
        "staticcheck",
        "delve",
        "clangd",
        "clang-format",
        "codelldb",
        "templ",
        "tailwindcss",
      },
    },
  },
  {
    "joerdav/templ.vim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "vimdoc",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "c",
        "templ",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
}
