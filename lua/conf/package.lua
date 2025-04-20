-- Bootstrap lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Plugin setup
require("lazy").setup({
	-- Simple plugins
	"folke/which-key.nvim",
	"folke/zen-mode.nvim",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",
	"mbbill/undotree",
	-- "github/copilot.vim",
	"rcarriga/nvim-notify",
	{ "mfussenegger/nvim-dap" },
	{ "echasnovski/mini.nvim", version = "*" },
	{ "RaafatTurki/hex.nvim" },

	-- UI & themes
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end

	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = false,
			insert_at_start = false,
		},
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Autopairs & editing enhancements
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
	},
	{
		"cohama/lexima.vim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "master",
	},

	-- Markdown rendering
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.nvim",
			-- Alternative dependencies:
			-- "echasnovski/mini.icons",
			-- "nvim-tree/nvim-web-devicons",
		},
	},

	-- Clipboard image pasting
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>pp", "<cmd>PasteImage<cr>", desc = "Paste Image from system clipboard" },
		},
	},

	-- File explorer
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- The LSP :skull:
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "ms-jpq/coq_nvim",       branch = "coq" }, -- 🐔 COQ
			{ "ms-jpq/coq.artifacts",  branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },

		},
		lazy = false,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },              -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken",                   -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},

}, {
	lazy = true,
})
