vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.formatoptions = ""

vim.opt.mouse = "a"

vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt.formatoptions = "cqrnj"
    end,
})

vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.cursorline = true
