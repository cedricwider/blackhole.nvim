local lsp_config_status_ok, volar = pcall(require, "lspconfig.volar")
if not lsp_config_status_ok then
	return
end

local M = {
	on_attach = function(client, _)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		volar.setup({
			filetypes = { "typescript", "vue" },
			documentFeatures = {
				documentColor = true,
				documentFormatting = false,
				documentSymbol = true,
				foldingRange = true,
				linkedEditingRange = true,
				selectionRange = true,
			},
		})
	end,
	-- options = {},
}
return M
