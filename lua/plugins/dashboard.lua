return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require('dashboard').setup {
			theme = 'hyper',
			disable_move = true,
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			config = {
				shortcut = {
					{ desc = '[  Github]', group = 'DashboardShortCut' },
					{ desc = '[  CierCier]', group = 'DashboardShortCut' },
				}
			},
		}
	end
}
