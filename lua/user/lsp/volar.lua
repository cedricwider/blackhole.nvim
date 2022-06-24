local lsp_config_status_ok, lsp_config = pcall(require, 'lspconfig')
if not lsp_config_status_ok then
  return
end

lsp_config.volar.setup {
  filetypes={'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'}
}
