-- Key mappings file
function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=true, silent=true })
end

function nmap(shortcut, command) map('n', shortcut, command) end
function imap(shortcut, command) map('i', shortcut, command) end
function vmap(shortcut, command) map('v', shortcut, command) end
function cmap(shortcut, command) map('c', shortcut, command) end
function tmap(shortcut, command) map('t', shortcut, command) end
function fmap(shortcut, func, args) vim.keymap.set('n', shortcut, func, args) end

-- general
nmap('<leader>svr', '<cmd>source $MYVIMRC<CR>')  -- source init.lua without restarting
nmap('<C-x>', 'dd')  -- one line delete ctrl + x

-- file io
nmap('<C-s>', '<cmd>w<CR>')  -- save file using ctrl + s
imap('<C-s>', '<cmd>w<CR>')
nmap('<S-q>', '<cmd>qa<CR>')  -- close file using shift + q

-- Split window
nmap('hs', '<C-w>s')
nmap('vs', '<C-w>v')
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')
vim.opt.splitbelow = true
vim.opt.splitright = true

-- PLUGINS
-- toggleterm
nmap('<F2>', '<Cmd>ToggleTerm size=10 direction=horizontal ToggleTermSetName t1<CR>')
nmap('<F3>', '<Cmd>ToggleTerm size=40 direction=vertical ToggleTermSetName t2<CR>')
nmap('<F4>', '<Cmd>ToggleTerm size=10 direction=float ToggleTermSetName t3<CR>')
nmap('<F9>', '<Cmd>TermExec cmd="python %:p"<CR>')
tmap('<Esc>', '<Cmd>NvimTreeFocus<CR>')
tmap('<C-h>', '<Cmd>wincmd h<CR>')
tmap('<C-j>', '<Cmd>wincmd j<CR>')
tmap('<C-k>', '<Cmd>wincmd k<CR>')
tmap('<C-l>', '<Cmd>wincmd l<CR>')

-- nvim-tree
nmap('{', "<cmd>NvimTreeToggle<CR>")
nmap('}', "<cmd>NvimTreeFocus<CR>")

-- telescope
fmap('<leader>ff', require('telescope.builtin').find_files, {})
fmap('<leader>fg', require('telescope.builtin').live_grep, {})
fmap('<leader>fb', require('telescope.builtin').buffers, {})
fmap('<leader>fh', require('telescope.builtin').help_tags, {})

-- barbar
nmap('<A-left>', '<Cmd>BufferPrevious<CR>')    -- move to previous
nmap('<A-right>', '<Cmd>BufferNext<CR>')    -- move to next
nmap('<S-A-left>', '<Cmd>BufferMovePrevious<CR>')    -- re-order to previous
nmap('<S-A-right>', '<Cmd>BufferMoveNext<CR>')    -- re-order to next
nmap('<A-p>', '<Cmd>BufferPin<CR>')    -- Pin buffer
nmap('<A-q>', '<Cmd>BufferClose<CR>')    -- close buffer  
nmap('<A-1>', '<Cmd>BufferGoto 1<CR>')  -- move to specific bar
nmap('<A-2>', '<Cmd>BufferGoto 2<CR>')
nmap('<A-3>', '<Cmd>BufferGoto 3<CR>')
nmap('<A-4>', '<Cmd>BufferGoto 4<CR>')
nmap('<A-5>', '<Cmd>BufferGoto 5<CR>')
nmap('<A-6>', '<Cmd>BufferGoto 6<CR>')
nmap('<A-7>', '<Cmd>BufferGoto 7<CR>')
nmap('<A-8>', '<Cmd>BufferGoto 8<CR>')
nmap('<A-9>', '<Cmd>BufferGoto 9<CR>')
nmap('<A-0>', '<Cmd>BufferLast<CR>')

-- Find files using Telescope command-line sugar.
-- nmap("<C-p>", "<cmd>Telescope find_files<cr>")
-- nmap("<leader>f", "<cmd>Telescope live_grep<cr>")
-- nmap("<leader>bb", "<cmd>Telescope buffers<cr>")
-- nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
--nmap('K', '<cmd>Lspsaga hover_doc<cr>')
--imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
--nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
--nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- git
--nmap('<C-g>', '<cmd>GitMessenger<cr>')



-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
