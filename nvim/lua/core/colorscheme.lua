-- Set colorscheme
local setup, kanagawa = pcall(require, "kanagawa")
if not setup then
  return
end

-- local specs = { all = { syntax = { builtin0 = "pink.bright" }}}
-- require("nightfox").setup({
--     options = {
--         styles = {
--             comments = "italic",
--             keywords = "bold",
--             types = "italic, bold",
--         }
--     },
--     specs = specs,
-- })

kanagawa.setup {
    undercurl=true,
    commentStyle={ italic = true },
    functionStyle={},
    keywordStyle={ italic = true },
    statementStyle={ bold = true },
    variablebuiltinStyle={ italic = true },
    specialReturn=false,
    specialException=true,
    dimInactive=true,
    terminalColors=true,
}

vim.cmd("colorscheme kanagawa")
require("plugins.feline")

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
