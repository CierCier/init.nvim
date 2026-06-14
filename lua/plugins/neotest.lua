return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/nvim-nio",
		"rouge8/neotest-rust",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-vitest",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-plenary",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rust"),
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
				require("neotest-vitest"),
				require("neotest-go"),
				require("neotest-plenary"),
			},
			status = {
				enabled = true,
				virtual_text = true,
			},
			output = {
				enabled = true,
				open_on_run = "short",
			},
			summary = {
				open = false,
				mappings = {
					attach = "a",
					expand = { "<CR>", "<2-LeftMouse>" },
				},
			},
		})

		local map = vim.keymap.set
		map("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Run Nearest Test" })
		map("n", "<leader>tR", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run Test File" })
		map("n", "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, { desc = "Run All Tests" })
		map("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last Test" })
		map("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Summary" })
		map("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Open Output" })
		map("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop Test Run" })
	end,
}
