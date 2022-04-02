local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[   ..                                      ..                                       ..            ]],
[[ dF                                  < .z@8"`           .uef^"                x .d88"             ]],
[['88bu.                     .u    .    !@88E           :d88E              u.    5888R              ]],
[['*88888bu         u      .d88B :@8c   '888E   u       `888E        ...ue888b   '888R        .u    ]],
[[  ^"*8888N     us888u.  ="8888f8888r   888E u@8NL      888E .z8k   888R Y888r   888R     ud8888.  ]],
[[ beWE "888L .@88 "8888"   4888>'88"    888E`"88*"      888E~?888L  888R I888>   888R   :888'8888. ]],
[[ 888E  888E 9888  9888    4888> '      888E .dN.       888E  888E  888R I888>   888R   d888 '88%" ]],
[[ 888E  888E 9888  9888    4888>        888E~8888       888E  888E  888R I888>   888R   8888.+"    ]],
[[ 888E  888F 9888  9888   .d888L .+     888E '888&      888E  888E u8888cJ888    888R   8888L      ]],
[[.888N..888  9888  9888   ^"8888*"      888E  9888.     888E  888E  "*888*P"    .888B . '8888c. .+ ]],
[[ `"888*""   "888*""888"     "Y"      '"888*" 4888"    m888N= 888>    'Y"       ^*888%   "88888%   ]],
[[    ""       ^Y"   ^Y'                  ""    ""       `Y"   888                 "%       "YP'    ]],
[[                                                            J88"                                  ]],
[[                                                            @%                                    ]],
[[                                                          :"                                      ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "chrisatmachine.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
