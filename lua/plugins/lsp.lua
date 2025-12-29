return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "ms-jpq/coq_nvim",       branch = "coq" }, -- 🐔 COQ
			{ "ms-jpq/coq.artifacts",  branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
			"MysticalDevil/inlay-hints.nvim",
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true,
			}
		end,
		config = function()
			local coq = require("coq")
			require("inlay-hints").setup()

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
					vim.diagnostic.jump({
						count = 1,
						float = true,
					})
				end, { desc = "Next Diagnostic", unpack(opts) })

				keymap("n", "<C-[>", function()
					vim.diagnostic.jump({
						count = -1,
						float = true,
					})
				end, { desc = "Prev Diagnostic", unpack(opts) })
				keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics", unpack(opts) })

				keymap("n", "<C-f>", function()
					vim.lsp.buf.format { async = true }
				end, { desc = "Format Document", unpack(opts) })

				_ = client
			end

			local servers = {
				"cssls",
				"gopls",
				"pylsp",
				"ts_ls",
				"zls",
				"jdtls",
				"somesass_ls",
			}

			local function config_lsp(server, config)
				config.on_attach = on_attach
				vim.lsp.config(server, coq.lsp_ensure_capabilities(config))
				vim.lsp.enable(server)
			end

			for _, lsp in ipairs(servers) do
				config_lsp(lsp, {
					on_attach = on_attach,
				})
			end

			-- Specific configs
			config_lsp("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
						diagnostics = { globals = { 'vim' } },
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
								"${3rd}/luv/library",
								"${3rd}/busted/library",
							},
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					}
				}
			})

			config_lsp("clangd", {
				settings = {
					clangd = {
						InlayHints = {
							Designators = true,
							Enabled = true,
							ParameterNames = true,
							DeducedTypes = true,
						},
						fallbackFlags = { "-std=c++20", "-Wall", "-Werror" },
					},
				}
			})

			config_lsp("qmlls", {
				cmd = { "qmlls6", "-E" },
			})

			config_lsp("hls", {
				settings = {
					haskell = { formattingProvider = "stylish-haskell" }
				}
			})

			config_lsp("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						inlayHints = {
							bindingModeHints = { enable = false },
							chainingHints = { enable = true },
							closingBraceHints = { enable = true, minLines = 25 },
							closureReturnTypeHints = { enable = "never" },
							lifetimeElisionHints = { enable = "never", useParameterNames = false },
							maxLength = 25,
							parameterHints = { enable = true },
							reborrowHints = { enable = "never" },
							renderColons = true,
							typeHints = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
						},
					}
				}

			})

			config_lsp("sourcekit", {
				settings = {
					
				}
			})

			config_lsp("asm_lsp", {
				settings = { cmd = "tinymist" }
			})

			config_lsp("typst_lsp", {
				settings = {}
			})

			vim.diagnostic.config({
				virtual_text = {
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				float = {
					source = "if_many",
					border = "rounded",
				}
			})

			-- Global toggle for format-on-save
			_G.format_on_save = true

			-- Manual command to toggle formatting
			vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
				_G.format_on_save = not _G.format_on_save
				vim.notify("Format on Save: " .. (_G.format_on_save and "Enabled" or "Disabled"))
			end, { desc = "Toggle auto format on save" })

			-- Manual formatting command
			vim.api.nvim_create_user_command("Format", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "Manually format buffer with LSP" })


			-- auto start COQ
			vim.cmd("COQnow -s")
		end,
	}
}
