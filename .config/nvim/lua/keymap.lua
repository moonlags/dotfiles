vim.keymap.set('n', '<leader>e', '<Cmd>Explore<CR>')
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

local fzf = require 'fzf-lua'
vim.keymap.set('n', '<leader><leader>', fzf.files)
vim.keymap.set('n', '<leader>/', fzf.live_grep)

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
