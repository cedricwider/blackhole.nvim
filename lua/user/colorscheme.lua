-- let ayucolor="mirage"
-- colorscheme ayu
vim.g.tokyonight_style = "storm"
vim.cmd([[
try
  colorscheme ayu
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
