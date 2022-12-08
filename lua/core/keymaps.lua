-- Key mappings file

-- Modes
--   normal = "n",
--   insert = "i",
--   visual = "v",
--   visual_block = "x",
--   command = "c",
--   terminal = "t",

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=true, silent=true })
end

function nimap(shortcut, command)
    map('n', shortcut, command)
    map('i', shortcut, command)
end

vim.g.mapleader = ' '

--------------
-- General
--------------
map('n', '<leader>svr', '<Cmd>source $MYVIMRC<CR>')  -- source init.lua without restarting
map('n', '<C-x>', 'dd')  -- one line delete ctrl + x
map('n', '<Tab>', '>>')
map('n', '<S-Tab>', '<<')

-- file io
nimap('<C-s>', '<cmd>w<CR>')  -- save file using ctrl + s
map('n', '<C-q>', '<cmd>qa<CR>')  -- close file using shift + q

-- window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<C-h>', '<Cmd>wincmd h<CR>')
map('t', '<C-j>', '<Cmd>wincmd j<CR>')
map('t', '<C-k>', '<Cmd>wincmd k<CR>')
map('t', '<C-l>', '<Cmd>wincmd l<CR>')

-- Window management
map('n', 'sq', '<Cmd>close<CR>')

-- Resize window with arrows
map('n', '<C-up>', ':resize +2<CR>')
map('n', '<C-down>', ':resize -2<CR>')
map('n', "<C-left>", ":vertical resize -2<CR>")
map('n', "<C-right>", ":vertical resize +2<CR>")

--------------
-- Plugins
--------------
-- Comment
if vim.fn.has("linux") or vim.fn.has("win32") then
    vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current)  -- The origin key command is 'gcc'
else
    vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current)  -- The origin key command is 'gcc'
end

-- toggleterm
nimap('<F2>', '<Cmd>ToggleTerm size=10 direction=horizontal ToggleTermSetName t1<CR>')
nimap('<F3>', '<Cmd>ToggleTerm size=40 direction=vertical ToggleTermSetName t2<CR>')
nimap('<F4>', '<Cmd>ToggleTerm size=10 direction=float ToggleTermSetName t3<CR>')
nimap('<F9>', '<Cmd>TermExec cmd="python %:p"<CR>')

-- nvim-tree
map('n', '<S-t>', "<Cmd>NvimTreeToggle<CR>")

-- telescope
map('n', '<leader>ff', "<Cmd>Telescope find_files<CR>")
map('n', '<leader>fg', "<Cmd>Telescope live_grep<CR>")
map('n', '<leader>fb', "<Cmd>Telescope buffers<CR>")
map('n', '<leader>fh', "<Cmd>Telescope help_tags<CR>")

-- barbar
nimap('<A-left>', '<Cmd>BufferPrevious<CR>')    -- move to previous
nimap('<A-right>', '<Cmd>BufferNext<CR>')    -- move to next
nimap('<S-A-left>', '<Cmd>BufferMovePrevious<CR>')    -- re-order to previous
nimap('<S-A-right>', '<Cmd>BufferMoveNext<CR>')    -- re-order to next
nimap('<A-p>', '<Cmd>BufferPin<CR>')    -- Pin buffer
nimap('<A-q>', '<Cmd>BufferClose<CR>')    -- close buffer  

-- LSP
--nmap('K', '<cmd>Lspsaga hover_doc<cr>')
--imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
--nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
--nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- git
--nmap('<C-g>', '<cmd>GitMessenger<cr>')

