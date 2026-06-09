return {
	"echasnovski/mini.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.trailspace").setup()
		require("mini.hipatterns").setup({
			highlighters = {
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})
		require("mini.comment").setup({
			mappings = {
				comment_line = "<C-/>",
				comment_visual = "<C-/>",
				textobject = "gc",
			},
		})
	end,
}
