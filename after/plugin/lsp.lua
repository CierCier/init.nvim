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

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.denols.setup {
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.tsserver.setup {
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
    single_file_support = true
}


lspconfig.gopls.setup {
    on_attach = lsp.on_attach,
    root_dir = lspconfig.util.root_pattern("go.mod"),
    single_file_support = true
}

lspconfig.pylsp.setup {
    on_attach = lsp.on_attach,
    filetypes = { "python" },
    single_file_support = true
}

lspconfig.zls.setup {
    on_attach = lsp.on_attach,
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern("build.zig")
}

lspconfig.omnisharp.setup {
    on_attach = lsp.on_attach,
    cmd = { "omnisharp", "-v"  };
}

lsp.nvim_workspace()

local cmp = require("cmp")


lsp.setup()
