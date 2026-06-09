vim.g.mapleader = " "

vim.keymap.set("n", "<C-c>", "<Esc>")

-- Save shortcut
vim.keymap.set("n", "<C-s>", function()
	if vim.bo.modified then
		vim.cmd("write")
	else
		print("No changes to save")
	end
end, { desc = "Save file" })

vim.keymap.set("n", "<A-ESC>", function()
	if vim.bo.modified then
		vim.cmd("write")
	end
	vim.cmd("quit")
end, { desc = "Save and quit" })

-- Move selected lines in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
