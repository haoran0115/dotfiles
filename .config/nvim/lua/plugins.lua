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
    use {'joshdick/onedark.vim'}
    use {'itchyny/lightline.vim'}
    use {'preservim/NERDTree'}
    -- use {'neoclide/coc.nvim', {'branch': 'release'}}
    use {'lervag/vimtex'}
    use {'tpope/vim-fugitive'}
    -- use {'junegunn/fzf', { 'do': { -> fzf#install() } }}
    use {'junegunn/fzf.vim'}
    use {'jiangmiao/auto-pairs'}
    use {'bfrg/vim-cpp-modern'}
    use {'tpope/vim-commentary'}
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- luasnip
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

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
end)
