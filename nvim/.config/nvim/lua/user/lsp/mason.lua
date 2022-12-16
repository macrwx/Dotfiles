local nnoremap = require("user.keymap").nnoremap
local lsps = {
	"sumneko_lua",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsps,
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end
local on_attach = function()
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	nnoremap("gD", vim.lsp.buf.declaration, { buffer = 0 })
	nnoremap("gd", vim.lsp.buf.definition, { buffer = 0 })
	nnoremap("K", vim.lsp.buf.hover, { buffer = 0 })
	nnoremap("gi", vim.lsp.buf.implementation, { buffer = 0 })
	nnoremap("<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
	nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, { buffer = 0 })
	nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, { buffer = 0 })
	nnoremap("<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { buffer = 0 })
	nnoremap("<space>D", vim.lsp.buf.type_definition, { buffer = 0 })
	nnoremap("<space>rn", vim.lsp.buf.rename, { buffer = 0 })
	nnoremap("<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
	nnoremap("gr", vim.lsp.buf.references, { buffer = 0 })
	nnoremap("<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, { buffer = 0 })
end
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(lsps) do
	lspconfig[lsp].setup({
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
end
