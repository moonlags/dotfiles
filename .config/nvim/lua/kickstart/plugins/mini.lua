return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = true }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.pairs').setup()
    require('mini.extra').setup()
    require('mini.diff').setup()

    require('mini.hues').setup {
      background = '#101010',
      foreground = '#f7f7f7',
      n_hues = 4,
      saturation = 'low',
    }

    require('mini.pick').setup()
    local builtin = MiniPick.builtin
    vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', builtin.grep_live, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sn', function()
      builtin.files(nil, { source = { cwd = vim.fn.stdpath 'config' } })
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
