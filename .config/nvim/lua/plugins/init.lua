return {
  { "nvim-neotest/nvim-nio" },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Add breakpoint at line" })
      vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "DAP Start or continue debugger" })
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "delve" } },
      },
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "staticcheck",
        "delve",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "gomod",
        "gosum",
        "gowork",
      },
    },
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    config = function(_, opts)
      require("gopher").setup(opts)
      vim.keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "GOLANG Add json struct tags" })
      vim.keymap.set("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "GOLANG Add yaml struct tags" })
    end,
  },
}
