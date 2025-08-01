vim.g.mapleader = " "


vim.keymap.set("n", "C-c", "<Esc>")




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
