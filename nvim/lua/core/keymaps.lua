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

-- This is for multiple mappings
function mmap(shortcut, command)
    map('n', shortcut, command)
    map('i', shortcut, command)
    map('t', shortcut, command)
end

vim.g.mapleader = ' '

--------------
-- General
--------------
map('n', '<C-x>', 'dd')  -- one line delete ctrl + x
map('n', '<Tab>', '>>')
map('n', '<S-Tab>', '<<')

-- file io
mmap('<C-s>', '<cmd>w<CR>')  -- save file using ctrl + s
mmap('<C-q>', '<cmd>qa<CR>')  -- close file using ctrl + q

-- window navigation
mmap('<C-h>', '<Cmd>wincmd h<CR>')
mmap('<C-j>', '<Cmd>wincmd j<CR>')
mmap('<C-k>', '<Cmd>wincmd k<CR>')
mmap('<C-l>', '<Cmd>wincmd l<CR>')
map('t', '<Esc>', '<C-\\><C-n>')

-- Window management
map('n', '-', '<Cmd>split<CR>')
map('n', '|', '<Cmd>vertical split<CR>')
map('n', 'se', '<C-w>=')
map('n', 'sq', '<Cmd>close<CR>')

-- Resize window with arrows
mmap('<Pageup>', '<Cmd>resize +2<CR>')
mmap('<PageDown>', '<Cmd>resize -2<CR>')
map('n', "_", "<Cmd>vertical resize -2<CR>")
map('n', "+", "<Cmd>vertical resize +2<CR>")

--------------
-- Plugins
--------------
-- Comment
vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current)  -- The origin key command is 'gcc'

-- nvim-tree
mmap('<F1>', "<Cmd>NvimTreeToggle<CR>")

-- toggleterm
mmap('<F2>', '<Cmd>ToggleTerm direction=float ToggleTermSetName t1<CR>')
mmap('<F3>', '<Cmd>ToggleTerm size=10 direction=horizontal ToggleTermSetName t2<CR>')
mmap('<F4>', '<Cmd>ToggleTerm size=82 direction=vertical ToggleTermSetName t3<CR>')
mmap('<F9>', '<Cmd>TermExec cmd="python %:p"<CR>')

-- telescope
map('n', '<leader>ff', "<Cmd>Telescope find_files<CR>")
map('n', '<leader>fg', "<Cmd>Telescope live_grep<CR>")
map('n', '<leader>fb', "<Cmd>Telescope buffers<CR>")
map('n', '<leader>fh', "<Cmd>Telescope help_tags<CR>")

-- barbar
mmap('<A-1>', '<Cmd>BufferGoto 1<CR>')    -- move to 1
mmap('<A-2>', '<Cmd>BufferGoto 2<CR>')    -- move to 2
mmap('<A-3>', '<Cmd>BufferGoto 3<CR>')    -- move to 3
mmap('<A-h>', '<Cmd>BufferPrevious<CR>')  -- move to previous
mmap('<A-l>', '<Cmd>BufferNext<CR>')      -- move to next
mmap('<A-p>', '<Cmd>BufferPin<CR>')       -- Pin buffer
mmap('<A-q>', '<Cmd>BufferClose<CR>')     -- close buffer  
mmap('<S-A-h>', '<Cmd>BufferMovePrevious<CR>')  -- re-order to previous
mmap('<S-A-l>', '<Cmd>BufferMoveNext<CR>')  -- re-order to next

-- LSP
map('n', '<leader>d', "<Cmd>lua vim.diagnostic.open_float()<CR>")
map('n', '[d', "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
map('n', ']d', "<Cmd>Lspsaga diagnostic_jump_next<CR>")
map('n', 'K', "<Cmd>Lspsaga hover_doc<CR>")
map('n', 'F', "<Cmd>Lspsaga lsp_finder<CR>")
map('n', 'gd', "<Cmd>Lspsaga peek_definition<CR>")
map('n', 'gD', "<Cmd>Lspsaga goto_definition<CR>")
map('n', 'gr', "<Cmd>Lspsaga rename ++project<CR>")

-- git
--nmap('<C-g>', '<cmd>GitMessenger<cr>')

