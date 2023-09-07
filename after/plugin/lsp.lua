local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'denols',
    'clangd',
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.denols.setup {
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

lsp.nvim_workspace()

local cmp = require("cmp")




lsp.setup()
