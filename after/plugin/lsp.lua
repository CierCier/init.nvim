local lspconfig = require('lspconfig')


vim.g.coq_settings = {
	auto_start = true,
}


local coq = require("coq")

local on_attach = function(client, bufnr)
	local keymap = vim.keymap.set
	local opts = { buffer = bufnr, noremap = true, silent = true }

	keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", unpack(opts) })
	keymap("n", "gr", vim.lsp.buf.references, { desc = "Find References", unpack(opts) })
	keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", unpack(opts) })
	keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", unpack(opts) })

	keymap("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol", unpack(opts) })
	keymap("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Code Action", unpack(opts) })

	keymap("n", "<C-]>", vim.diagnostic.goto_next, { desc = "Next Diagnostic", unpack(opts) })
	keymap("n", "<C-[>", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic", unpack(opts) })
	keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics", unpack(opts) })

	keymap("n", "<gf", function()
		vim.lsp.buf.format { async = true }
	end, { desc = "Format Document", unpack(opts) })
end


local servers = {
	"clangd",
	"cssls",
	"gopls",
	"hls",
	"pylsp",
	"rust_analyzer",
	"ts_ls",
	"zls",
	"jdtls"
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = coq.lsp_ensure_capabilities(),
	}
end




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
_G.format_is_enabled = true

-- Manual command to toggle formatting
vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
	_G.format_is_enabled = not _G.format_is_enabled
	vim.notify("Format on Save: " .. (_G.format_is_enabled and "Enabled" or "Disabled"))
end, { desc = "Toggle auto format on save" })

-- Manual formatting command
vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Manually format buffer with LSP" })

-- Setup auto formatting when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if not client.server_capabilities.documentFormattingProvider then
			return
		end

		-- 🧼 Auto-format on save if enabled
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatOnSaveEachBuf", { clear = true }),
			buffer = bufnr,
			callback = function()
				if _G.format_is_enabled then
					vim.lsp.buf.format {
						async = false,
						filter = function(c) return c.id == client.id end,
					}
				end
			end,
		})
	end,
})



-- Setup for anything specific to a language server



-- lua-lsp for Neovim

lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = coq.lsp_ensure_capabilities(),

	settings = {
		Lua = {
			runtime = {
				-- Tell the server you're using LuaJIT (used by Neovim)
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = { 'vim' }, -- Recognize the `vim` global
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
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
}
