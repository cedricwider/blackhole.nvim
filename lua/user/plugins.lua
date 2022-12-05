local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("kdheepak/lazygit.nvim")
	use("tpope/vim-fugitive")
	use("ggandor/leap.nvim")
	use("rgroli/other.nvim")
	use("yamatsum/nvim-cursorline")
	use("dm1try/golden_size")

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")
	use("ayu-theme/ayu-vim")
	use("folke/tokyonight.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("mfussenegger/nvim-lint")
	use("mhartington/formatter.nvim")

	-- Telescope
	use("xiyaowong/telescope-emoji.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("ThePrimeagen/harpoon")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Added by Ced
	use("vimwiki/vimwiki")
	use("norcalli/nvim-colorizer.lua")
	use("tpope/vim-unimpaired")
	use("tpope/vim-surround")
	use("phaazon/hop.nvim")
	use("edkolev/tmuxline.vim")
	use("alexghergh/nvim-tmux-navigation")
	use("mattn/emmet-vim")
	use("kevinhwang91/rnvimr")
	use("stevearc/dressing.nvim")
	use("rcarriga/nvim-notify")
	use("michaeljsmith/vim-indent-object")
	use("github/copilot.vim")
	use("jeetsukumaran/vim-indentwise")
	use({
		"utilyre/barbecue.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"smiteshp/nvim-navic",
			"kyazdani42/nvim-web-devicons", -- optional
		},
		config = function()
			require("barbecue").setup()
		end,
	})
	-- use("kosayoda/nvim-lightbulb")
	use({
		"xiyaowong/nvim-transparent",
		opt = true,
		cond = function()
			return not vim.g.neovide
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})

	-- Testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"haydenmeade/neotest-jest",
			"olimorris/neotest-rspec",
		},
		run = ":UpdateRemotePlugins",
	})

	-- Github Integration
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		opt = true,
		event = "BufReadPre",
		module = { "dap" },
		wants = { "nvim-dap-virtual-text", "nvim-dap-ui" },
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
			{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
		},
		config = function()
			require("user.dap").setup()
		end,
	})
	use({ "microsoft/vscode-js-debug", opt = true, run = "npm install --legacy-peer-deps && npm run compile" })
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	-- use("suketa/nvim-dap-ruby")

	--Local plugins
	use("~/Developer/lua/whid")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
