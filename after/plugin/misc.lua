local rmd = require("render-markdown")

vim.keymap.set('n', '<leader>md', function()
	rmd.toggle()
end, { desc = "Toggle Markdown Render" })
