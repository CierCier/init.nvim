return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		left = {
			-- Oil as a sidebar if it's ever used that way
			{
				ft = "oil",
				title = "Oil",
				size = { width = 30 },
			},
		},
		bottom = {
			{
				ft = "toggleterm",
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
				ft = "lazyterm",
				title = "LazyTerm",
				size = { height = 0.4 },
				filter = function(buf)
					return not vim.b[buf].lazyterm_terminal
				end,
			},
			{
				ft = "qf",
				title = "QuickFix",
			},
			{
				ft = "help",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{ ft = "spectre_panel", size = { height = 0.4 } },
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
