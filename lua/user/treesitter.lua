local config_loaded, config = pcall(require, "nvim-treesitter.configs")
if not config_loaded then
	return
end

local parsers_loaded, parser_configs = pcall(require, "nvim-treesitter.parsers")
if parsers_loaded then
	-- These two are optional and provide syntax highlighting
	-- for Neorg tables and the @document.meta tag
	parser_configs.norg_meta = {
		install_info = {
			url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
			files = { "src/parser.c" },
			branch = "main",
		},
	}

	parser_configs.norg_table = {
		install_info = {
			url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
			files = { "src/parser.c" },
			branch = "main",
		},
	}
end

config.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing

	autopairs = {
		enable = true,
	},

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},

	indent = {
		enable = true,
		disable = { "yaml" },
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
			},
		},

		move = {
			enabled = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},

	-- incremental_selection = {
	--   enable = true,
	--   keymaps = {
	--
	--   }
	-- }

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
