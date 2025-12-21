return {
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
	keys = {
		-- Move to previous/next
		{ '<A-w>', '<Cmd>BufferPrevious<CR>', desc = "Previous Buffer" },
		{ '<A-e>', '<Cmd>BufferNext<CR>', desc = "Next Buffer" },
		-- Goto buffer in position...
		{ '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = "Goto Buffer 1" },
		{ '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = "Goto Buffer 2" },
		{ '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = "Goto Buffer 3" },
		{ '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = "Goto Buffer 4" },
		{ '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = "Goto Buffer 5" },
		{ '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = "Goto Buffer 6" },
		{ '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = "Goto Buffer 7" },
		{ '<A-8>', '<Cmd>BufferGoto 8<CR>', desc = "Goto Buffer 8" },
		{ '<A-9>', '<Cmd>BufferGoto 9<CR>', desc = "Goto Buffer 9" },
		{ '<A-0>', '<Cmd>BufferLast<CR>', desc = "Goto Last Buffer" },
		{ '<A-p>', '<Cmd>BufferPin<CR>', desc = "Pin Buffer" },
		{ '<A-q>', '<Cmd>BufferClose<CR>', desc = "Close Buffer" },
	},
}
