local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local on_attach = function(_, bufnr)
    -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local nnoremap = function(lhs, rhs, desc)
        require("user.keymap").nnoremap(
            lhs,
            rhs,
            { buffer = bufnr, desc = desc }
        )
    end

    nnoremap("gD", vim.lsp.buf.declaration, "goto definition")
    nnoremap("gd", vim.lsp.buf.definition, "goto declaration")
    nnoremap("K", vim.lsp.buf.hover, "hover")
    nnoremap("gi", vim.lsp.buf.implementation, "goto implementation")
    nnoremap("<C-k>", vim.lsp.buf.signature_help, "get signature help")
    nnoremap("<space>D", vim.lsp.buf.type_definition, "")
    nnoremap("<space>rn", vim.lsp.buf.rename, "rename")
    nnoremap("<space>ca", vim.lsp.buf.code_action, "get code action")
    nnoremap("gr", vim.lsp.buf.references, "get references")
    nnoremap("<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, "format file")
end

local servers = {
    "sumneko_lua",
    "clangd",
    "cmake"
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for _, lsp in pairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                },
            },
        },
    },
})
