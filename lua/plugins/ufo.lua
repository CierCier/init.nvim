return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "BufReadPost",
	opts = {
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	},
	init = function()
		vim.keymap.set("n", "zR", function()
			require("ufo").openAllFolds()
		end, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", function()
			require("ufo").closeAllFolds()
		end, { desc = "Close all folds" })
		vim.keymap.set("n", "zr", function()
			require("ufo").openFoldsExceptKinds()
		end, { desc = "Fold less" })
		vim.keymap.set("n", "zm", function()
			require("ufo").closeFoldsWith()
		end, { desc = "Fold more" })
		vim.keymap.set("n", "zp", function()
			require("ufo").peekFoldedLinesUnderCursor()
		end, { desc = "Peek fold" })
	end,
}
