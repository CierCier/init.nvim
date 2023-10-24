local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


lsp.ensure_installed({
})

lspconfig.clangd.setup {
    on_attach = lsp.on_attach,
    single_file_support = true,
    filetypes = { "c", "cpp", "cxx" }

}

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.denols.setup {
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    filetypes = { "javascript", "typescript" },
}

lspconfig.tsserver.setup {
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
    single_file_support = true
}


lspconfig.pylsp.setup {
    on_attach = lsp.on_attach,
    filetypes = { "python" },
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern("pyproject.toml"),
}

lspconfig.rust_analyzer.setup {
    on_attach = lsp.on_attach,
    root_dir =  lspconfig.util.root_pattern("Cargo.toml"),
    single_file_support = true,
    filetypes = { "rust" },
}

lspconfig.dartls.setup {
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
    filetypes = { "dart" },
}


lsp.nvim_workspace()

local cmp = require("cmp")


lsp.setup()
