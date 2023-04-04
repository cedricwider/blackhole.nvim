-- vim.g.copilot_tiletypes = { ["*"] = false, typescript = true, vue = true }
vim.g.copilot_no_tab_map = true

vim.cmd([[highlight CopiloSuggestion guifg=#555555 ctermfg=8]])
vim.cmd([[imap <silent><script><expr> <C-D> copilot#Accept("\<CR>")]])
