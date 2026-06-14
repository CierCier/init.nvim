return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		left = {
		-- Explorer as a sidebar
		{
			ft = "snacks_explorer",
			title = "Explorer",
			size = { width = 30 },
		},
		},
		bottom = {
			{
				ft = "snacks_terminal",
				size = { height = 0.4 },
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{
				ft = "noice",
				size = { height = 0.4 },
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{
				ft = "qf",
				title = "QuickFix",
			},
			{
				ft = "help",
				size = { height = 20 },
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				ft = "trouble",
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
		},
		right = {
			{
				ft = "trouble",
				title = "Trouble Symbols",
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == "" and (vim.api.nvim_buf_get_name(buf):find("symbols") or vim.api.nvim_buf_get_name(buf):find("lsp"))
				end,
			},
		},
		opts = {
			fixed_win_size = true,
			animate = {
				enabled = false, -- Disable animation for a snappier feel
			},
		},
	},
}
