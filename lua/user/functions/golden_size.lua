local M = {
	toggle = function()
		local current_value = vim.api.nvim_get_var("golden_size_off")
		vim.api.nvim_set_var("golden_size_off", current_value == 1 and 0 or 1)
	end,
}

return M
