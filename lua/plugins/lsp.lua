return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			-- Modern diagnostic config
			vim.diagnostic.config({
				virtual_text = {
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				float = {
					source = "if_many",
					border = "rounded",
				},
				signs = true,
				underline = true,
			})

			-- Shared on_attach function
			local on_attach = function(client, bufnr)
				local keymap = vim.keymap.set
				local opts = { buffer = bufnr, noremap = true, silent = true }

				keymap("n", "<C-d>", vim.lsp.buf.definition, { desc = "Go to Definition", unpack(opts) })
				keymap("n", "cr", vim.lsp.buf.references, { desc = "Find References", unpack(opts) })
				keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", unpack(opts) })
				keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", unpack(opts) })

				keymap("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol", unpack(opts) })
				keymap("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code Action", unpack(opts) })

				keymap("n", "<C-]>", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { desc = "Next Diagnostic", unpack(opts) })

				keymap("n", "<C-[>", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, { desc = "Prev Diagnostic", unpack(opts) })

				keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics", unpack(opts) })

				-- Enable inlay hints if supported by the server
				if client:supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end

			-- Get default capabilities from blink.cmp
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			-- List of servers to enable
			local servers = {
				"cssls",
				"gopls",
				"pylsp",
				"ts_ls",
				"zls",
				"jdtls",
				"somesass_ls",
				"lua_ls",
				"clangd",
				"qmlls",
				"hls",
				"rust_analyzer",
				"sourcekit",
				"asm_lsp",
				"typst_lsp",
			}

			-- Configure each server using the new Neovim native API
			for _, server in ipairs(servers) do
				local config = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				-- Handle server-specific settings
				if server == "lua_ls" then
					config.settings = {
						Lua = {
							runtime = { version = 'LuaJIT' },
							diagnostics = { globals = { 'vim' } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
						}
					}
				elseif server == "clangd" then
					config.settings = {
						clangd = {
							InlayHints = { Enabled = true },
						}
					}
				elseif server == "rust_analyzer" then
					config.settings = {
						["rust-analyzer"] = {
							inlayHints = { enable = true },
						}
					}
				end

				-- THE NEW WAY: Use vim.lsp.config and vim.lsp.enable
				local server_opts = require('lspconfig.configs')[server] or {}
				local default_config = server_opts.default_config or {}
				local final_config = vim.tbl_deep_extend("force", default_config, config)
				
				vim.lsp.config(server, final_config)
				vim.lsp.enable(server)
			end

			-- Formatting is now handled by conform.nvim
			-- We keep a simple command to toggle auto-format globally
			vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				vim.notify("Auto Format on Save: " .. (vim.g.disable_autoformat and "Disabled" or "Enabled"))
			end, { desc = "Toggle auto format on save" })
		end,
	}
}
