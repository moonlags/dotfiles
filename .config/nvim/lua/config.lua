vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.guicursor = 'i:block'
vim.o.nu = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.list = true
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.undofile = true
vim.o.inccommand = 'nosplit'
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.winborder = "single"

vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.cmd('hi! link netrwMarkFile Search')
