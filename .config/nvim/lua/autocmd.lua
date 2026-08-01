vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank({ timeout = 170 })
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})
