local function attach_lsp()
	vim.schedule(function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype ~= "" then
				pcall(vim.api.nvim_buf_call, buf, function()
					vim.api.nvim_exec_autocmds("FileType", { buffer = buf })
				end)
			end
		end
	end)
end

return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {
		save_empty = false,
	},
	init = function()
		if vim.fn.argc(-1) == 0 then
			vim.api.nvim_create_autocmd("UIEnter", {
				once = true,
				callback = function()
					require("persistence").load({ last = true, after = attach_lsp })
				end,
			})
		end
	end,
	keys = {
		{ "<leader>qs", function() require("persistence").load({ after = attach_lsp }) end, desc = "Restore Session" },
		{ "<leader>ql", function() require("persistence").load({ last = true, after = attach_lsp }) end, desc = "Restore Last Session" },
		{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
	},
}
