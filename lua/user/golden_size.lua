local status_ok, golden_size = pcall(require, "golden_size")
if not status_ok then
	return
end

vim.api.nvim_set_var("golden_size_off", 0)

local function golden_size_ignore()
	return vim.api.nvim_get_var("golden_size_off")
end

local function ignore_by_buftype(types)
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")
	for _, type in pairs(types) do
		if type == buftype then
			return 1
		end
	end
end

golden_size.set_ignore_callbacks({
	{ golden_size_ignore },
	{ ignore_by_buftype, { "terminal", "quickfix", "nofile" } },
	{ golden_size.ignore_float_windows },
	{ golden_size.ignore_by_window_flag },
})
