-- Key mappings file
function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=true, silent=true })
end

function nimap(shortcut, command)
    map('n', shortcut, command)
    map('i', shortcut, command)
end

-- Modes
--   normal = "n",
--   insert = "i",
--   visual = "v",
--   visual_block = "x",
--   command = "c",
--   terminal = "t",

function nmap(shortcut, command) map('n', shortcut, command) end
function imap(shortcut, command) map('i', shortcut, command) end
function vmap(shortcut, command) map('v', shortcut, command) end
function cmap(shortcut, command) map('c', shortcut, command) end
function tmap(shortcut, command) map('t', shortcut, command) end

vim.g.mapleader = ' '

--------------
-- General
--------------
nmap('<leader>svr', '<Cmd>source $MYVIMRC<CR>')  -- source init.lua without restarting
nmap('<C-x>', 'dd')  -- one line delete ctrl + x
nmap('<Tab>', '>>')
nmap('<S-Tab>', '<<')

-- file io
nimap('<C-s>', '<cmd>w<CR>')  -- save file using ctrl + s
nmap('<S-q>', '<cmd>qa<CR>')  -- close file using shift + q

-- window navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Window management
nmap('sh', '<C-w>s') -- split horizontal
nmap('sv', '<C-w>v') -- split vertical
nmap('se', '<C-w>=') -- make split windows equal width & height
nmap('sq', '<Cmd>close<CR>')

-- Resize window with arrows
nmap('<C-up>', ':resize +2<CR>')
nmap('<C-down>', ':resize -2<CR>')
nmap("<C-left>", ":vertical resize -2<CR>")
nmap("<C-right>", ":vertical resize +2<CR>")

--------------
-- Plugins
--------------
-- toggleterm
nimap('<F2>', '<Cmd>ToggleTerm size=10 direction=horizontal ToggleTermSetName t1<CR>')
nimap('<F3>', '<Cmd>ToggleTerm size=40 direction=[vertical, horizontal] ToggleTermSetName t2<CR>')
nimap('<F4>', '<Cmd>ToggleTerm size=10 direction=float ToggleTermSetName t3<CR>')
nimap('<F9>', '<Cmd>TermExec cmd="python %:p"<CR>')
tmap('<Esc>', '<C-\\><C-n>')
tmap('<C-h>', '<Cmd>wincmd h<CR>')
tmap('<C-j>', '<Cmd>wincmd j<CR>')
tmap('<C-k>', '<Cmd>wincmd k<CR>')
tmap('<C-l>', '<Cmd>wincmd l<CR>')

-- nvim-tree
nmap('<leader>[', "<Cmd>NvimTreeToggle<CR>")
nmap('<leader>]', "<Cmd>NvimTreeFocus<CR>")

-- telescope
nmap('<leader>ff', "<Cmd>Telescope find_files<CR>")
nmap('<leader>fg', "<Cmd>Telescope live_grep<CR>")
nmap('<leader>fb', "<Cmd>Telescope buffers<CR>")
nmap('<leader>fh', "<Cmd>Telescope help_tags<CR>")

-- barbar
nimap('<A-left>', '<Cmd>BufferPrevious<CR>')    -- move to previous
nimap('<A-right>', '<Cmd>BufferNext<CR>')    -- move to next
nimap('<S-A-left>', '<Cmd>BufferMovePrevious<CR>')    -- re-order to previous
nimap('<S-A-right>', '<Cmd>BufferMoveNext<CR>')    -- re-order to next
nimap('<A-p>', '<Cmd>BufferPin<CR>')    -- Pin buffer
nimap('<A-q>', '<Cmd>BufferClose<CR>')    -- close buffer  
nimap('<A-1>', '<Cmd>BufferGoto 1<CR>')  -- move to specific bar
nimap('<A-2>', '<Cmd>BufferGoto 2<CR>')
nimap('<A-3>', '<Cmd>BufferGoto 3<CR>')
nimap('<A-4>', '<Cmd>BufferGoto 4<CR>')
nimap('<A-5>', '<Cmd>BufferGoto 5<CR>')
nimap('<A-6>', '<Cmd>BufferGoto 6<CR>')
nimap('<A-7>', '<Cmd>BufferGoto 7<CR>')
nimap('<A-8>', '<Cmd>BufferGoto 8<CR>')
nimap('<A-9>', '<Cmd>BufferGoto 9<CR>')
nimap('<A-0>', '<Cmd>BufferLast<CR>')

-- LSP
--nmap('K', '<cmd>Lspsaga hover_doc<cr>')
--imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
--nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
--nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- git
--nmap('<C-g>', '<cmd>GitMessenger<cr>')

