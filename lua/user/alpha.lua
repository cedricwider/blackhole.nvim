local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[              ..          ..                             ..                                    ..            ]],
[[        . uW8"      x .d88"                        < .z@8"`        .uef^"                x .d88"             ]],
[[        `t888        5888R                          !@88E        :d88E              u.    5888R              ]],
[[         8888   .    '888R         u           .    '888E   u    `888E        ...ue888b   '888R        .u    ]],
[[         9888.z88N    888R      us888u.   .udR88N    888E u@8NL   888E .z8k   888R Y888r   888R     ud8888.  ]],
[[         9888  888E   888R   .@88 "8888" <888'888k   888E`"88*"   888E~?888L  888R I888>   888R   :888'8888. ]],
[[         9888  888E   888R   9888  9888  9888 'Y"    888E .dN.    888E  888E  888R I888>   888R   d888 '88%" ]],
[[         9888  888E   888R   9888  9888  9888        888E~8888    888E  888E  888R I888>   888R   8888.+"    ]],
[[         9888  888E   888R   9888  9888  9888        888E '888&   888E  888E u8888cJ888    888R   8888L      ]],
[[        .8888  888"  .888B . 9888  9888  ?8888u../   888E  9888.  888E  888E  "*888*P"    .888B . '8888c. .+ ]],
[[         `%888*%"    ^*888%  "888*""888"  "8888P'  '"888*" 4888" m888N= 888>    'Y"       ^*888%   "88888%   ]],
[[            "`         "%     ^Y"   ^Y'     "P'       ""    ""    `Y"   888                 "%       "YP'    ]],
[[                                                                       J88"                                  ]],
[[                                                                       @%                                    ]],
[[                                                                     :"                                      ]],
[[                                           _            .                                                    ]],
[[                                          u            @88>                                                  ]],
[[                             u.    u.    88Nu.   u.    %8P      ..    .     :                                ]],
[[                           x@88k u@88c. '88888.o888c    .     .888: x888  x888.                              ]],
[[                          ^"8888""8888"  ^8888  8888  .@88u  ~`8888~'888X`?888f`                             ]],
[[                            8888  888R    8888  8888 ''888E`   X888  888X '888>                              ]],
[[                            8888  888R    8888  8888   888E    X888  888X '888>                              ]],
[[                            8888  888R    8888  8888   888E    X888  888X '888>                              ]],
[[                            8888  888R   .8888b.888P   888E    X888  888X '888>                              ]],
[[                           "*88*" 8888"   ^Y8888*""    888&   "*88%""*88" '888!`                             ]],
[[                             ""   'Y"       `Y"        R888"    `~    "    `"`                               ]],
[[                                                        ""                                                   ]],
[[                                                                                                             ]],
[[                                                                                                             ]],
[[                                                                                                             ]]
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
