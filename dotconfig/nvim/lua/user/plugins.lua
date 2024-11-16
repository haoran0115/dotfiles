-- plugins
return require('lazy').setup({
    {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    -- use {'itchyny/lightline.vim'}
    {'nvim-tree/nvim-tree.lua'},
    {'lervag/vimtex'},
    {'tpope/vim-fugitive'},
    {'junegunn/fzf.vim'},
    -- {'jiangmiao/auto-pairs'},
    {'bfrg/vim-cpp-modern'},
    {'tpope/vim-commentary'},
    {"akinsho/toggleterm.nvim", version = '*'},
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    -- tab and bottom
    'nvim-lualine/lualine.nvim',
    {'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'},

    -- color schemes
    'gbprod/nord.nvim',
    -- use 'shaunsingh/nord.nvim'
    -- use { 'sainnhe/sonokai' }
    'navarasu/onedark.nvim',
    -- use { 'danilo-augusto/vim-afterglow' }
    -- use { 'Mofiqul/dracula.nvim' }
    -- use { 'morhetz/gruvbox' }
    -- use { 'sainnhe/everforest' }

    -- luasnip
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v1.*",
        -- install jsregexp (optional!:).
        build = "make install_jsregexp"
    },

    -- startup welcome page
    {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },

    -- friendly-snippets
    "rafamadriz/friendly-snippets",

    -- nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-omni',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',

    -- dictional completion for nvim-cmp
    'uga-rosa/cmp-dictionary',

    -- git diff functions
    'airblade/vim-gitgutter',

    -- icons
    'ryanoasis/vim-devicons',

    -- typst
    -- 'kaarmu/typst.vim',
    {'kaarmu/typst.vim', ft = {'typst'}},

})


