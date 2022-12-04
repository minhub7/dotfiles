-- Set colorscheme
local setup, nightfox = pcall(require, "nightfox")
if not setup then
  return
end

local specs = {
    all = {
        syntax = { builtin0 = "pink.bright" }
   }
}

require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic, bold",
        }
    },
    specs = specs,
})

vim.cmd("colorscheme nightfox")
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
