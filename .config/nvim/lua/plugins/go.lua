return {
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
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function()
      require("dap-go").setup()
    end,
  },
}
