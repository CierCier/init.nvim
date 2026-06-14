return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ui = {
			check_outdated_packages_on_open = false,
		},
	},
	config = function()
		local servers = require("config.servers")
		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
		})
	end,
}
