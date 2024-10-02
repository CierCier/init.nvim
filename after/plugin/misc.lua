

local rmd = require("render-markdown")

vim.keymap.set('n', '<leader>mt', function()
    rmd.toggle()
end)

