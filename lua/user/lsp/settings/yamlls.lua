local global_settings = require("user.lsp.settings.globals")

local M = {
	flags = global_settings.lsp_flags,
	on_attach = global_settings.on_attach,
}
return M
