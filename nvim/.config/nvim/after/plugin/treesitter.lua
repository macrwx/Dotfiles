local ok, _ = pcall(require, "nvim-treesitter")

if not ok then
	return
end

local configs = require("nvim-treesitter.configs")
configs.setup({
	highlight = {
		enable = true,
	},
})
