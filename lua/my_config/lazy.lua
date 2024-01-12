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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    "tpope/vim-rails",
    "tpope/vim-endwise",
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        event = "VeryLazy",
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    { 'nvim-treesitter/nvim-treesitter' },
    'nvim-treesitter/playground',
    { 'ThePrimeagen/harpoon',           event = "VeryLazy" },
    { 'mbbill/undotree',                event = "VeryLazy" },
    { 'tpope/vim-fugitive',             event = "VeryLazy" },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },
    'simrat39/rust-tools.nvim',

    "tiagovla/scope.nvim",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        "folke/which-key.nvim",
    },

    'andweeb/presence.nvim',

    'mfussenegger/nvim-dap',

    {
        'saecki/crates.nvim',
        ft = { "rust", "toml" }
    },
    --Packer
    { 'Issafalcon/lsp-overloads.nvim' }
})
