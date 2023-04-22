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

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
          cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
        -- they way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
  
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'look' },
      { name = 'buffer' },
      { name = 'path' },
      {
        name = 'dictionary',
        keyword_length = 2
      }
    })
  })

-- cmp-dict
local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  async = false,
  sqlite = false,
  max_items = -1,
  capacity = 5,
  debug = false,
})

dict.switcher({
  spelllang = {
    en = "~/.config/nvim/dict/en.dict",
  },
})

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
require('lspconfig')['fortls'].setup {
  capabilities = capabilities,
  root_dir = function(fname)
    return util.root_pattern '.fortls'(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
  cmd = { "fortls", "--notify_init", "--hover_signature", "--hover_language=fortran", "--use_signature_help", "--lowercase_intrinsics" }
}
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
  capabilities = capabilities
}
require('lspconfig')['lua_ls'].setup{
  capabilities = capabilities
}
require('lspconfig')['ccls'].setup{
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir = function(fname)
    return util.root_pattern({'compile_commands.json', '.ccls',})(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
}
