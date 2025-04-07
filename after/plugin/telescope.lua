
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Telescope Project View"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = "Telescope Git Files"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep> ") })
end, {desc = "Telescope Grep"})

vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


