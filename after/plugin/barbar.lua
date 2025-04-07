local map = vim.api.nvim_set_keymap;


-- Move to previous/next
map('n', '<A-w>', '<Cmd>BufferPrevious<CR>', { desc = "Previous Buffer", noremap = true, silent = true })
map('n', '<A-e>', '<Cmd>BufferNext<CR>', { desc = "Next Buffer", noremap = true, silent = true })

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { desc = "Goto Buffer 1", noremap = true, silent = true })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { desc = "Goto Buffer 2", noremap = true, silent = true })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { desc = "Goto Buffer 3", noremap = true, silent = true })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { desc = "Goto Buffer 4", noremap = true, silent = true })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { desc = "Goto Buffer 5", noremap = true, silent = true })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { desc = "Goto Buffer 6", noremap = true, silent = true })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { desc = "Goto Buffer 7", noremap = true, silent = true })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { desc = "Goto Buffer 8", noremap = true, silent = true })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { desc = "Goto Buffer 9", noremap = true, silent = true })
map('n', '<A-0>', '<Cmd>BufferLast<CR>', { desc = "Goto Last Buffer", noremap = true, silent = true })


map('n' , '<A-p>', '<Cmd>BufferPin<CR>', { desc = "Pin Buffer", noremap = true, silent = true })

map('n', '<A-q>', '<Cmd>BufferClose<CR>', { desc = "Close Buffer", noremap = true, silent = true })
