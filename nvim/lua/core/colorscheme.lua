-- Set colorscheme
local setup_nightfox, nightfox = pcall(require, "nightfox")
if (not setup_nightfox) then return end

-- local setup_kanagawa, kanagawa = pcall(require, "kanagawa")
-- if (not setup_kanagawa) then return end


local specs = { all = { syntax = { builtin0 = "pink.bright" }}}
nightfox.setup({
    options = {
        dim_inactive=true,
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic, bold",
        }
    },
    specs = specs,
})

vim.cmd("colorscheme carbonfox")
require("plugins.feline")

-- kanagawa.setup {
--     undercurl=true,
--     commentStyle={ italic = true },
--     functionStyle={},
--     keywordStyle={ italic = true },
--     statementStyle={ bold = true },
--     typeStyle={ italic=true, bold=true },
--     variablebuiltinStyle={ italic = true },
--     specialReturn=false,
--     specialException=true,
--     dimInactive=true,
--     globalStatus=true,
--     terminalColors=true,
-- }

-- require("gruvbox").setup()
-- require('lualine').setup {
--     options = {
--         theme='gruvbox',
--     },
--     sections = {
--         lualine_y = { 'location' },
--         lualine_z = { 'progress' },
--     },
-- }


