local M = {
	on_attach = function(client, _)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		local ts_utils = require("nvim-lsp-ts-utils")
		local ts_util_options = require("user.lsp.settings.tsutil")

		ts_utils.setup(ts_util_options)
		ts_utils.setup_client(client)
		-- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
		-- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
		-- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
	end,
	options = {},
}
return M
