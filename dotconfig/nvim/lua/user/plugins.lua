-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use { "wbthomason/packer.nvim" }
    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    }
    -- use {'itchyny/lightline.vim'}
    use {'nvim-tree/nvim-tree.lua'}
    use {'lervag/vimtex'}
    use {'tpope/vim-fugitive'}
    use {'junegunn/fzf.vim'}
    -- use {'jiangmiao/auto-pairs'}
    use {'bfrg/vim-cpp-modern'}
    use {'tpope/vim-commentary'}
    use {"akinsho/toggleterm.nvim", tag = '*'}
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- tab and bottom
    use { 'nvim-lualine/lualine.nvim' }
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- color schemes
    use 'gbprod/nord.nvim'
    -- use 'shaunsingh/nord.nvim'
    -- use { 'sainnhe/sonokai' }
    use { 'navarasu/onedark.nvim' }
    -- use { 'danilo-augusto/vim-afterglow' }
    -- use { 'Mofiqul/dracula.nvim' }
    -- use { 'morhetz/gruvbox' }
    -- use { 'sainnhe/everforest' }

    -- luasnip
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v1.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    -- startup welcome page
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    -- friendly-snippets
    use "rafamadriz/friendly-snippets"

    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-omni'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    -- dictional completion for nvim-cmp
    use 'uga-rosa/cmp-dictionary'

    -- git diff functions
    use 'airblade/vim-gitgutter'

    -- icons
    use 'ryanoasis/vim-devicons'
end)


