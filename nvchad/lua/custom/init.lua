-- local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

vim.scriptencoding = "utf-8"
vim.g.copilot_no_tab_map = true

--------------------------------------------------

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.title = true
opt.backup = false -- don't save backup files
opt.writebackup = false
opt.number = true
opt.relativenumber = true
opt.backspace = { "start", "eol", "indent" }

-- tabs & indentation
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- search settings
opt.hlsearch = true
