local opts = { noremap = true, silent = true }
local fzf = require 'fzf-lua'

vim.keymap.set('n', '<leader>e', '<Cmd>Explore<CR>')

vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fg', fzf.live_grep)

vim.keymap.set('n', '<leader>qo', '<Cmd>copen<CR>', opts)
vim.keymap.set('n', '<leader>qc', '<Cmd>cclose<CR>', opts)

vim.keymap.set('n', 'gd', fzf.lsp_definitions, opts)
vim.keymap.set('n', 'gr', fzf.lsp_references, opts)
vim.keymap.set('n', 'gi', fzf.lsp_implementations, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions, opts)
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, opts)

vim.keymap.set('n', '<leader>dl', fzf.diagnostics_workspace)
vim.keymap.set('n', '<leader>df', fzf.diagnostics_document)

vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
