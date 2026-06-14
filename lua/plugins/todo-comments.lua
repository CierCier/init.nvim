return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{ "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
		{ "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
		{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
		{ "<leader>st", function() Snacks.picker.todo_comments() end,                                 desc = "Todo" },
		{ "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
	},
}
