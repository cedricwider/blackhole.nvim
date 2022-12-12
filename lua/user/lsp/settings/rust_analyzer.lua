local global_settings = require("user.lsp.settings.globals")

return {
	flags = global_settings.lsp_flags,
	on_attach = global_settings.on_attach,
	settings = {
		checkOnSave = {
			command = "clippy",
		},
	},
}
