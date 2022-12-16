local M = {}

local keymap = function(mode)
	local _opts = { silent = true, noremap = true }
	return function(lhs, rhs, opts)
		if opts then
			vim.fn.extend(_opts, opts)
		end
		vim.keymap.set(mode, lhs, rhs, _opts)
	end
end

M.nnoremap = keymap("n")

return M
