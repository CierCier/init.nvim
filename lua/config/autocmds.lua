vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local file_path = vim.fn.expand("%:p")
		local parent = vim.fn.fnamemodify(file_path, ":h")

		local ok, _ = vim.loop.fs_stat(parent)
		if not ok then
			vim.fn.mkdir(parent, "p")
		end

		local ok_trail, trailspace = pcall(require, "mini.trailspace")
		if ok_trail then
			pcall(trailspace.trim)
		end
	end,
	desc = "Auto-create parent + trim trailing whitespace",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	desc = "Highlight yanked text",
})
