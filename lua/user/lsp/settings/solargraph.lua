local global_settings = require("user.lsp.settings.globals")
local M = {
	cmd = { "/home/cedricwider/.rbenv/shims/solargraph", "stdio" },
	flags = global_settings.lsp_flags,
	filetypes = { "ruby" },
	init_options = { formatting = false },
	on_attach = global_settings.on_attach,
	settings = {
		solargraph = {
			completion = true,
			diagnostis = false,
		},
	},
}
return M
