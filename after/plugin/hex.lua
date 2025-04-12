local hex = require("hex")



hex.setup()


vim.keymap.set("n", "<leader>xx", function()
	hex.toggle()
end, { desc = "Toggle Hex" }
)
