local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    "folke/which-key.nvim",
    "folke/zen-mode.nvim",

    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
    "mbbill/undotree",
    "github/copilot.vim",



    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    {
        'folke/tokyonight.nvim',
        lazy=false,
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},


        },

    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function ()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = false,
            insert_at_start = false,
        }

    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    },

}, {
    lazy = true,
})



