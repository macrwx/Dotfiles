vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.formatoptions = vim.opt.formatoptions
    - "a"
    - "t"
    + "c"
    + "q"
    - "o"
    + "r"
    + "n"
    + "j"
    - "2"

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.mouse = "a"

vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"

vim.g.mapleader = " "
