local global_settings = require("user.lsp.settings.globals")

local function organize_imports()
	vim.lsp.buf.execute_command({
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	})
end

local M = {
	filetypes = { "vue" },
	flags = global_settings.lsp_flags,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
	on_attach = function(client, bufnr)
		global_settings.on_attach(client, bufnr)
		client.server_capabilities.document_range_formatting = false
		client.server_capabilities.document_formatting = false
	end,
}

return M
