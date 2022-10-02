local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.null-ls")
require("user.lsp.settings.volar-setup")
require("user.lsp.handlers").setup()
