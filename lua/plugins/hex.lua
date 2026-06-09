return {
	"RaafatTurki/hex.nvim",
	config = function()
		require("hex").setup()
	end,
	keys = {
		{ "<leader>xh", function() require("hex").toggle() end, desc = "Toggle Hex" },
	}
}
