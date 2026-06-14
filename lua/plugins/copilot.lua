return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		init = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
		end,
		opts = {},
	},
}
