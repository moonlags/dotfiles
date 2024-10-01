return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Add breakpoint at line" })
      vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "DAP Start or continue debugger" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require "dap", require "dapui"
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
    "nvim-neotest/nvim-nio",
  },
}
