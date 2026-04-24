vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/nvim-mini/mini.statusline',
  'https://github.com/nvim-mini/mini.hues',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/lewis6991/gitsigns.nvim',
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") }
}

local statusline = require('mini.statusline')
statusline.setup { use_icons = true }
statusline.section_location = function()
  return '%2l:%-2v'
end

require('mason').setup()

local actions = require 'fzf-lua.actions'
require('fzf-lua').setup {
  keymap = {
    builtin = {
      ['<C-f>'] = 'preview-page-down',
      ['<C-b>'] = 'preview-page-up',
    },
    fzf = {
      ['ctrl-a'] = 'toggle-all',
      ['ctrl-t'] = 'first',
      ['ctrl-g'] = 'last',
      ['ctrl-d'] = 'half-page-down',
      ['ctrl-u'] = 'half-page-up',
    },
  },
  actions = {
    files = {
      ['ctrl-q'] = actions.file_sel_to_qf,
      ['ctrl-h'] = actions.toggle_hidden,
      ['enter'] = actions.file_edit_or_qf,
    },
  },
}

-- vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next search result' })
-- vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous search result' })

require('nvim-autopairs').setup {}
require('gitsigns').setup {}

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'normal', },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = { default = { 'lsp', 'path' } },
})

require('mini.hues').setup {
  background = '#101010',
  foreground = '#f7f7f7',
  n_hues = 4,
  saturation = 'low',
}
