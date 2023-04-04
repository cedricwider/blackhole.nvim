local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
require("user.lsp.diagnostics").setup()

local lsp_servers = {
	"jsonls",
	"rust_analyzer",
	"solargraph",
	"lua_ls",
	"tsserver",
	"volar",
	"yamlls",
}

for _, language_server in ipairs(lsp_servers) do
	local loaded, configuration = pcall(require, "user/lsp/settings/" .. language_server)
	if not loaded then
		print("Unable to load configuration for " .. language_server)
		return
	end

	lspconfig[language_server].setup(configuration)
end
