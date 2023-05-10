local setup, lualine = pcall(require, "lualine")
if (not setup) then return end

-- Bubbles config for lualine
-- Author: lokesh-krishna
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#d6d6d6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#505050',
  orange = '#FFDE2B',
  light_grey = '#a0a0a0',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.orange, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.cyan } },
  visual = { a = { fg = colors.black, bg = colors.violet } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.light_grey, bg = colors.black },
    b = { fg = colors.light_grey, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = bubbles_theme,
    section_separators = { left = '', right = '' },
    component_separators = '│',
    refresh = { statusline = 200, }
  },
  sections = {
    lualine_a = {{ 'mode', separator={ left='' }, right_padding=2 }},
    lualine_b = {
            { 'filename', path=1, symbols={ modified='●'}},
            { 'diagnostics', symbols={ error = ' ', warn = ' ', info = ' ', hint = ' ' }}
        },
    lualine_c = { 'branch', 'diff' },
    lualine_x = {},
    lualine_y = { 'filetype', 'fileformat', 'encoding' },
    lualine_z = { 'location', { 'progress', separator={ right = '' }, left_padding = 2 }},
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

-- -- Override 'encoding': Don't display if encoding is UTF-8.
-- encoding = function()
--   local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
--   return ret
-- end,
-- -- fileformat: Don't display if &ff is unix.
-- fileformat = function()
--   local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
--   return ret
-- end
