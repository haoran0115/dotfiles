local ls = require "luasnip"
local types = require "luasnip.util.types"
ls.config.set_config{
    enable_autosnippets = true
}
require("luasnip.loaders.from_vscode").lazy_load()

