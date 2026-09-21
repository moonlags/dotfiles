vim.pack.add {
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/nvim-mini/mini.statusline',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/nvim-mini/mini.hues',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/romus204/tree-sitter-manager.nvim',
    'https://github.com/yonatanperel/lake-dweller.nvim',
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
}

local statusline = require('mini.statusline')
statusline.setup { use_icons = true }
statusline.section_location = function()
    return '%2l:%-2v'
end

require('mini.surround').setup()
require('mason').setup()

local actions = require 'fzf-lua.actions'
require('fzf-lua').setup {
    winopts = {
        border = "single",
        preview = {
            border = "single",
        }
    },
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
            ['ctrl-q'] = { fn = actions.file_sel_to_qf, prefix = "select-all+" },
            ['ctrl-h'] = actions.toggle_hidden,
            ['enter'] = actions.file_edit_or_qf,
        },
        grep = {
            ['ctrl-q'] = { fn = actions.file_sel_to_qf, prefix = "select-all+" }
        }
    },
}

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

require('tree-sitter-manager').setup({
    ensure_installed = {
        'go'
    },
    auto_install = true,
    border = 'single'
})

-- require('mini.hues').setup {
--     background = '#101010',
--     foreground = '#f7f7f7',
--     n_hues = 4,
--     saturation = 'low',
-- }

require("lake-dweller").setup({
    variant = "lake-dweller",
})
vim.cmd.colorscheme "lake-dweller"

local set_hl = vim.api.nvim_set_hl
set_hl(0, 'GitSignsAdd',    { fg = '#8ac490', bg = 'NONE' })
set_hl(0, 'GitSignsChange', { fg = '#b0c0e0', bg = 'NONE' })
set_hl(0, 'GitSignsDelete', { fg = '#ef8a90', bg = 'NONE' })
