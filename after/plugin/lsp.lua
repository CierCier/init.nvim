local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'clangd',
    'tsserver',
    'deno',
    'rust_analyzer',
})

lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-u>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-h>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({select=true}),
    ["<C-Space>"] = cmp.mapping.complete()

})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil


lsp.on_attach(function(client, bufnr)
    local opts = {buffer=bufnr, remap=false}
    vim.keymap.set("n", "<C-d>", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.workspace_sympol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
   

    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.refrences() end, opts)

    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup_nvim_cmp({mappings=cmp_mappings})

lsp.set_preferences({
    suggest_lsp_server = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.setup()

vim.diagnostic.config({
    vurtual_text=true
})
