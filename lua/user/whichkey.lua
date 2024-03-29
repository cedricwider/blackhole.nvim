local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local leader_mappings = {
	a = { "<cmd>Alpha<cr>", "Alpha" },

	b = {
		name = "Buffers",
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"list-buffers",
		},
		d = { "<cmd>Bdelete!<cr>", "Kill buffer" },
		o = { "<cmd>%bd|e#|bd#<cr>", "Close other buffers" },
		n = { "<cmd>bnext<cr>", "Next buffer" },
		p = { "<cmd>bprevious<cr>", "Previous buffer" },
	},

	c = {
		name = "Command line (Terminal)",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		r = { "<cmd>lua _RUBY_TOGGLE()<cr>", "Ruby" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		c = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	d = {
		name = "Debug",
		["<F1>"] = { "<cmd>Telescope dap commands<cr>", "List commands (help)" },
		["<F8>"] = { "<cmd>lua require('telescope').load_extension('dap')<cr>", "Initialize (help)" },
		C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
		E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
		K = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
		L = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
		S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
		U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		c = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		d = { "<cmd>lua require'dap'.continue()<cr>", "Continue (F5)" },
		e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
		f = { "<cmd>Telescope dap configurations<cr>", "Run Configuration" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		j = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into (F9)" },
		k = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out (F7)" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
		n = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over (F8)" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
	},

	e = {
		name = "Edit Settings",
		f = { "<cmd>edit ~/.config/nvim/lua/user/formatter.lua <CR>", "Formatters" },
		i = { "<cmd>edit ~/.config/nvim/init.lua <CR>", "init.lua" },
		k = { "<cmd>edit ~/.config/nvim/lua/user/whichkey.lua <CR>", "Keymaps" },
		p = { "<cmd>edit ~/.config/nvim/lua/user/plugins.lua <CR>", "Plugins" },
		r = { "<cmd>luafile ~/.config/nvim/init.lua<cr>", "Reload Configuration" },
		s = { "<cmd>lua require('luasnip.loaders').edit_snippet_files()<cr>", "Snippets" },
	},

	f = {
		name = "File",
		e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		f = { "<cmd>Telescope find_files <cr>", "Find files" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		l = { "<cmd>NvimTreeFindFile<cr>", "Locate in Tree" },
	},

	g = {
		name = "Git",
		a = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		p = { "<cmd>Git push<cr>", "push" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		s = { "<cmd>Git<cr>", "status" },
		u = { "<cmd>Git pull<cr>", "pull" },
		v = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		C = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		U = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
	},

	j = {
		name = "Jump",
		["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Go to Mark 1" },
		["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Go to Mark 2" },
		["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Go to Mark 3" },
		["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Go to Mark 4" },
		["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Go to Mark 5" },
		["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Go to Mark 6" },
		["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Go to Mark 7" },
		["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Go to Mark 8" },
		["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Go to Mark 9" },
		b = { "<cmd>HopWordBC<cr>", "Before Cursor" },
		j = { "<cmd>HopLineAC<cr>", "Line downwards" },
		l = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "List marks" },
		m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file" },
		k = { "<cmd>HopLineBC<cr>", "Line upwards" },
		o = { "<cmd>Telescope treesitter theme=ivy<cr>", "Symbols" },
		s = { "<cmd>HopChar2<cr>", "Sequence (2 Chars)" },
		w = { "<cmd>HopWordAC<cr>", "Word" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>FormatWrite<cr>", "Format" },
		i = { "<cmd>Mason<cr>", "Info" },
		I = { "<cmd>LspInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	q = { "<cmd>Bdelete!<CR>", "Close Buffer" },

	r = {
		name = "seaRch",
		["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer (fuzzy)" },
		a = { "<cmd>Telescope live_grep theme=ivy<cr>", "all (Find Text)" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		e = { "<cmd>Telescope emoji<cr>", "Emoji" },
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		q = { "<cmd>Telescope quickfix theme=ivy<cr>", "Quickfix" },
		r = { "<cmd>RnvimrToggle<cr>", "Ranger" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		H = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
	},

	s = { "<cmd>wall!<CR>", "Save" },

	t = {
		name = "Test",
		N = { "<cmd>lua require('neotest').run.run({strategy='dap'})<cr>", "Debug nearest test" },
		f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
		i = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Info" },
		j = { "<cmd>lua require('neotest').jump.next()<cr>", "Jump to next test" },
		k = { "<cmd>lua require('neotest').jump.prev()<cr>", "Jump to prev test" },
		n = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
		s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Sumamry" },
	},

	w = {
		name = "Windows",
		["-"] = { "<cmd>split<cr>", "Split horizontal" },
		["/"] = { "<cmd>vsplit<cr>", "Split vertical" },
		d = { "<cmd>quit<cr>", "Close" },
		m = { "<cmd>only<cr>", "Maximize" },
	},

	x = { "<cmd>qa!<CR>", "Quit" },
	[";"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
	["<tab>"] = { "<cmd>Other<cr>", "Swap previous buffer" },
}

local space_mappings = {
	q = { "<cmd>bdelete<cr>", "Close Window and Buffer" },
	h = {
		name = "GitHub (Octo)",
		p = {
			name = "Pull Requests",
			c = { "<cmd>Octo pr commits<cr>", "Commits" },
			d = { "<cmd>Octo pr diff<cr>", "Diff" },
			f = { "<cmd>Octo pr search<cr>", "Find PullRequests" },
			h = { "<cmd>Octo pr changes<cr>", "Hunks" },
			o = { "<cmd>Octo pr checkout<cr>", "Checkout" },
			p = { "<cmd>Octo pr list<cr>", "Open PRs" },
			r = { "<cmd>Octo pr ready<cr>", "Mark draft as Ready" },
			t = { "<cmd>Octo pr checks<cr>", "Checks" },
			w = { "<cmd>Octo pr browser<cr>", "Browser (Web)" },
			x = { "<cmd>Octo pr close<cr>", "Close PR" },
			y = { "<cmd>Octo pr url<cr>", "Yank URL" },
			l = {
				name = "Label",
				a = { "<cmd>Octo label add<cr>", "Add Label" },
				r = { "<cmd>Octo label remove<cr>", "Remove Label" },
				c = { "<cmd>Octo label create<cr>", "Create Label" },
			},
			m = {
				name = "Merge",
				c = { "<cmd>Octo pr merge commit<cr>", "Commit" },
				r = { "<cmd>Octo pr merge rebase<cr>", "Rebase" },
				s = { "<cmd>Octo pr merge squash<cr>", "Squash" },
			},
		},
		r = {
			name = "Review",
			c = { "<cmd>Octo review comment<cr>", "Comment review" },
			d = { "<cmd>Octo review submit<cr>", "Submit Review" },
			e = { "<cmd>Octo review resume<cr>", "Edit (pending) Review" },
			r = { "<cmd>Octo review start<cr>", "Start Review" },
			x = { "<cmd>Octo review discard<cr>", "Discard Review" },
		},
	},
	t = {
		name = "Toggle",
		t = { "<cmd>TransparentToggle<cr>", "Transparent" },
		g = { "<cmd>lua require'user.functions.golden_size'.toggle()<cr>", "Golden Size" },
	},
}

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local leader_options = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local space_options = {
	mode = "n", -- NORMAL mode
	prefix = "<space>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

which_key.setup(setup)
which_key.register(leader_mappings, leader_options)
which_key.register(space_mappings, space_options)
