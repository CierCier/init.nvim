return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = false,
					jump = { close = true },
					git_status_open = true,
					layout = {
						preset = "sidebar",
						preview = false,
						border = "rounded",
					},
				},
			},
		},
		styles = {
			notification = {
				wo = { wrap = true }
			}
		}
	},
	keys = {
		{ "\\", function() Snacks.explorer() end, desc = "Explorer Sidebar" },
		{ "<leader>pf", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<C-p>", function() Snacks.picker.git_files() end, desc = "Git Files" },
		{ "<leader>ps", function() Snacks.picker.grep({ pattern = vim.fn.input("Grep> ") }) end, desc = "Grep" },
		{ "<leader>vh", function() Snacks.picker.help() end, desc = "Help Tags" },
		{
			"<leader>e",
			function()
				Snacks.explorer({
					layout = {
						preset = "default",
						preview = true,
					},
				})
			end,
			desc = "Explorer Float",
		},
		{ "<leader>E", function() Snacks.explorer.reveal() end, desc = "Reveal in Explorer" },
		{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
		{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
		{ "<A-t>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
		{ "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal", mode = "t" },
		{ "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore", mode = "t" },
		{ "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
		{ "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...) Snacks.debug.inspect(...) end
				_G.bt = function() Snacks.debug.backtrace() end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Set the notify function to snacks
				vim.notify = Snacks.notifier.notify
			end,
		})
	end,
}
