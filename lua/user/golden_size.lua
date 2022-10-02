local status_ok, golden_size = pcall(require, "golden_size")
if not status_ok then
	return
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
	{ ignore_by_buftype, { "terminal", "quickfix", "nofile" } },
	{ golden_size.ignore_float_windows },
	{ golden_size.ignore_by_window_flag },
})
