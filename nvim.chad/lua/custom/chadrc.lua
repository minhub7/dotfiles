---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon", "github_dark" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {},
  telescope = { style = "bordered" },

  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"

      return {
        cursor_position = function()
          local line = vim.fn.line "."
          local col = vim.fn.virtcol "."

          -- lets store current logs
          local cp = st_modules.cursor_position()

          return string.format("%3d:%-4d", line, col) .. cp
        end,
      }
    end,
  },

  tabufline = {
    show_numbers = true,
  },

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
