return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {  },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({

			highlight = {
				enable = true,

				additional_vim_regex_highlighting = false,
			},
		})

	end,
}
