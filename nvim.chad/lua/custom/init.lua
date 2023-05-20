-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.scriptencoding = "utf-8"
vim.g.copilot_no_tab_map = true

--------------------------------------------------
local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  backup = false, -- don't save backup files
  writebackup = false,
  mouse = "a",
  laststatus = 3, -- global statusline
  timeoutlen = 400,
  updatetime = 250, -- faster completion

  -- line numbers
  number = true,
  relativenumber = true,

  -- tabs & indentation
  tabstop = 4,
  shiftwidth = 4,
  smarttab = true,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- cursor line
  cursorline = true,

  -- appearance
  termguicolors = true,

  -- backspace
  backspace = { "start", "eol", "indent" },

  -- split windows
  splitright = true,
  splitbelow = true,

  -- search settings
  smartcase = true,
  ignorecase = true,
  hlsearch = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
