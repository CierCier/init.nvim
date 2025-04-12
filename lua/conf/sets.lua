vim.opt.guicursor = ""

vim.opt.nu = true             -- line numbes
vim.opt.relativenumber = true -- relative line numbers, help to make jumps

vim.opt.tabstop = 4           -- render width of tab
vim.opt.softtabstop = 4       -- number of spaces inserted for a tab
vim.opt.shiftwidth = 4        -- indentation width
vim.opt.expandtab = false     -- whether tab should be expanded to spaces

vim.opt.smartindent = true    -- tries to guess indent levels

vim.opt.wrap = false          -- whether to wrap long lines

vim.opt.swapfile = false      -- wheter to use a swap file
vim.opt.backup = false        -- whether to use a backup file
vim.opt.undofile = true       -- persistent undo, so you can undo even after closing the file

vim.opt.scrolloff = 8         -- minimum number of lines to keep above and below the cursor
vim.opt.signcolumn = "yes"    -- always show the sign column, so that it doesn't shift when a sign appears
vim.opt.isfname:append("@-@") -- allow @-@ in filenames

vim.opt.termguicolors = true

vim.opt.colorcolumn = "120" -- highlight column 90
