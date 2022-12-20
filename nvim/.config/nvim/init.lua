require("user.autocmd")
require("user.plugins")
require("user.lsp")

local nnoremap = require("user.keymap").nnoremap

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
