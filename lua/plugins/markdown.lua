return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	config = function()
		local rmd = require("render-markdown")
		rmd.setup({})
		vim.keymap.set('n', '<leader>md', function()
			rmd.toggle()
		end, { desc = "Toggle Markdown Render" })
	end
}
