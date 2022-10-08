local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		ruby = {
			require("formatter.filetypes.ruby").rubocop,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
			require("formatter.filetypes.typescript").eslint_d,
		},
	},
})
