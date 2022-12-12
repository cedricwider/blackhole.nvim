local global_settings = require("user.lsp.settings.globals")

local M = {
	filetypes = { "typescript", "vue" },
	flags = global_settings.lsp_flags,
	on_attach = function(client, bufnr)
		global_settings.on_attach(client, bufnr)
		client.server_capabilities.document_range_formatting = false
		client.server_capabilities.document_formatting = false
	end,
}

return M
