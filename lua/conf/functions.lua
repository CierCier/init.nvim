vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local file_path = vim.fn.expand("%:p")
		local parent = vim.fn.fnamemodify(file_path, ":h")

		-- Ensure the parent directory exists

		local ok, _ = vim.loop.fs_stat(parent)
		if not ok then
			vim.fn.mkdir(parent, "p")
		end
	end,
	desc = "Format on save if enabled",
})
