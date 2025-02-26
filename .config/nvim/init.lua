-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'lazy-plugins'

vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy',
        },
        assist = {
          importGranularity = 'module',
          importPrefix = 'by_self',
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
