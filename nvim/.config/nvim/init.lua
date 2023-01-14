require("user.autocmd")
require("user.plugins")
require("user.lsp")

local nnoremap = require("user.keymap").nnoremap

vim.g.mapleader = " "

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<leader>pv", "<CMD>Ex<CR>")
