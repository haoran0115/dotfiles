-- appearance

-- nord theme
require("nord").setup({
    transparent = true,
    errors = { mode = "none" },
})
vim.cmd[[colorscheme nord]]

-- -- onedark theme
-- require('onedark').setup {
--     style = 'dark',
--     transparent = true,
--     diagnostics = {
--         darker = false,
--         background = false,
--     }
-- }
-- require('onedark').load()

-- vim.cmd([[
-- "if (empty($TMUX))                   " 24bit true color
-- "  if (has("nvim"))
-- "    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- "  endif
-- "  if (has("termguicolors"))
-- "    set termguicolors
-- "  endif
-- "endif
-- "set cursorline " highlight current line

-- "set background=dark                 " dark background & remove background color
-- hi Normal       guibg=NONE ctermbg=NONE
-- hi NormalNC     guibg=NONE ctermbg=NONE
-- hi EndOfBuffer  guibg=NONE ctermbg=NONE
-- hi Terminal     guibg=NONE ctermbg=NONE
-- hi LineNr       guibg=NONE ctermbg=NONE
-- hi SignColumn   guibg=NONE ctermbg=NONE
-- hi WinSeparator guibg=NONE guifg=NONE
-- hi NvimTreeNormal guibg=NONE guifg=NONE
-- hi NvimTreeNormalNC guibg=NONE guifg=NONE
-- hi NvimTreeEndOfBuffer guibg=NONE guifg=NONE
-- set fillchars+=vert:\ 
-- set fillchars+=eob:\ 
-- ]])

