local rmd = require("render-markdown")

vim.keymap.set('n', '<leader>md', function()
	rmd.toggle()
end, { desc = "Toggle Markdown Render" })




-- Auto Pair

local ultima = require('ultimate-autopair')
local ultima_config = { ultima.extend_default({}) }



ultima.init(ultima_config)
