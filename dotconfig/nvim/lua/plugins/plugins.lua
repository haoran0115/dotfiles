-- plugins
return {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
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
    {'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},

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
        -- version = "v1.*",
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

    -- git diff functions
    'airblade/vim-gitgutter',

    -- icons
    'ryanoasis/vim-devicons',

    -- typst
    -- 'kaarmu/typst.vim',
    {'kaarmu/typst.vim', ft = {'typst'}},

    -- encryption
    'jamessan/vim-gnupg',

    -- parenthesis
    'tpope/vim-surround',

    -- completions
    -- nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-omni',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
    'uga-rosa/cmp-dictionary',
    'f3fora/cmp-spell',

    -- -- coq_nvim
    -- {
    --     "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    --     lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    --     dependencies = {
    --       -- main one
    --       { "ms-jpq/coq_nvim", branch = "coq" },
      
    --       -- 9000+ Snippets
    --       { "ms-jpq/coq.artifacts", branch = "artifacts" },
      
    --       -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    --       -- Need to **configure separately**
    --       { 'ms-jpq/coq.thirdparty', branch = "3p" }
    --       -- - shell repl
    --       -- - nvim lua api
    --       -- - scientific calculator
    --       -- - comment banner
    --       -- - etc
    --     },
    --     init = function()
    --       vim.g.coq_settings = {
    --           auto_start = true, -- if you want to start COQ at startup
    --           -- Your COQ settings here
    --       }
    --     end,
    --     config = function()
    --         -- Your LSP settings here
    --         -- coq
    --         local lspconfig = require "lspconfig"
    --         local coq = require "coq"

    --         -- python
    --         lspconfig.pyright.setup{}
    --         lspconfig.pyright.setup{coq.lsp_ensure_capabilities(pyright)}

    --         -- latex
    --         lspconfig.texlab.setup{}
    --         lspconfig.texlab.setup{coq.lsp_ensure_capabilities(texlab)}
    --     end,
    -- },

}


