vim.pack.add {
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/yonatanperel/lake-dweller.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
}

vim.cmd.colorscheme("lake-dweller")

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
    { "telescope" }
}

require('nvim-autopairs').setup {}

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'normal', },
    completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
    }
})

require("lake-dweller").setup({
    variant = "lake-dweller",
})
-- vim.cmd.colorscheme "lake-dweller"

local function treesitter_try_attach(buf, language)
    if not vim.treesitter.language.add(language) then return end
    vim.treesitter.start(buf, language)
    local has_ident_query = vim.treesitter.query.get(language, 'indents') ~= nil
    if has_ident_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end

local available_parsers = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        local installed_parsers = require('nvim-treesitter').get_installed 'parsers'
        if not vim.tbl_contains(installed_parsers, language) and vim.tbl_contains(available_parsers, language) then
            require('nvim-treesitter').install(language)
        end

        treesitter_try_attach(buf, language)
    end,
})
