-- completion settings
vim.cmd([[
set pumheight=15
]])
-- nvim-cmp
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require'cmp'
local luasnip = require("luasnip")
luasnip.config.set_config({
    region_check_events = 'InsertEnter',
    delete_check_events = 'CursorMoved,TextChanged,InsertLeave'
})

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('luasnip').config.set_config({
        --     region_check_events = 'InsertEnter',
        --     delete_check_events = 'InsertLeave'
        -- })
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },


    mapping = cmp.mapping.preset.insert({


      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-j>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.jump(1)
        -- else
        --   fallback()
        end
      end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        -- else
        --   fallback()
        end
      end, { "i", "s" }),

      -- ["<Esc>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --       cmp.abort()
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),

      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp',},
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'path' },
        { name = 'luasnip', }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      },
      {
        { name = 'look' },
        { name = 'buffer' },
        -- {
        --   name = "spell",
        --   option = {
        --       keep_all_entries = false,
        --       enable_in_context = function()
        --           return true
        --       end,
        --       preselect_correct_word = true,
        --   },
        -- },
        -- { name = 'dictionary', keyword_length = 4 }
      }),

    completion = {
        keyword_length = 1,
    }
  })

-- -- cmp-dict
-- local dict = require("cmp_dictionary")
-- dict.setup({
--   paths = { "/home/shiroha/.config/nvim/dict/en.dict" },
--   exact_length = 2,
--   first_case_insensitive = true,
--   document = {
--     enable = true,
--     command = { "wn", "${label}", "-over" },
--   },
-- })


  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require 'lspconfig.util'
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- -- language server configurations
-- fortran
require('lspconfig')['fortls'].setup {
  capabilities = capabilities,
  root_dir = function(fname)
    return util.root_pattern '.fortls'(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
  cmd = { "fortls", "--notify_init", "--hover_signature", "--hover_language=fortran", "--use_signature_help", "--lowercase_intrinsics" }
}
-- python
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
-- latex
require('lspconfig')['texlab'].setup {
  capabilities = capabilities
}
-- lua
require('lspconfig')['lua_ls'].setup{
  capabilities = capabilities
}
-- c, cpp
require('lspconfig')['ccls'].setup{
  capabilities = capabilities,
  init_options = {
      cache = {
        directory = '/tmp/ccls-cache'
      },
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir = function(fname)
    return util.root_pattern({'compile_commands.json', '.ccls',})(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
    -- return util.root_pattern({'compile_commands.json', '.ccls',})(fname) or util.find_git_ancestor(fname)
  end,
}
-- typst
require'lspconfig'.typst_lsp.setup{
  capabilities = capabilities,
  root_dir = function(fname)
    return util.root_pattern({'compile_commands.json', '.ccls',})(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
}
-- cmake
require'lspconfig'.cmake.setup{
    capabilities = capabilities
}
