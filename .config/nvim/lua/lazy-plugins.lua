-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.which-key',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.lsp',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.nvim-cmp',
  require 'kickstart.plugins.theme',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.oil',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
}, {
  ui = {
    icons = {},
  },
})
