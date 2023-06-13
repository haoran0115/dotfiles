vim.opt.termguicolors = true
require("bufferline").setup{
    highlights = {
        buffer_selected = {
            bold = true,
            italic = false,
        },
    },
    options = {
        separator_style = {'', ''},
        offsets ={
            {
                filetype = "NvimTree",
                text = "NvimTree",
                text_align = "left",
                separator = true,
            }
        }
    }
}

