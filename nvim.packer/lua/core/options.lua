vim.scriptencoding = 'utf-8'

local options = {
    encoding='utf-8',
    fileencoding='utf-8',
    title=true,
    backup=false,
    writebackup=false,
    mouse="a",
    laststatus=2,
    visualbell=true,
    wildmenu=true,
    completeopt={"menuone", "noselect"},
    timeoutlen=400,
    updatetime=250,  -- faster completion

    -- line numbers
    number=true,
    relativenumber=true,

    -- tabs & indentation
    tabstop=4,
    shiftwidth=4,
    smarttab=true,
    expandtab=true,
    autoindent=true,
    smartindent=true,
    showtabline=2,

    -- cursor line
    cursorline=true,

    -- appearance
    termguicolors=true,
    background="dark",
    signcolumn="yes",

    -- backspace
    backspace={'start', 'eol', 'indent'},

    -- split windows
    splitright=true,
    splitbelow=true,

    -- search settings
    smartcase=true,
    ignorecase=true,
    hlsearch=true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.clipboard:append("unnamedplus")  -- clipboard
vim.g.copilot_no_tab_map = true  -- copilot
--    vim.opt.iskeyword:append("-")
