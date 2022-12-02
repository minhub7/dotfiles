vim.scriptencoding = 'utf-8'

local options = {
    encoding='utf-8',
    fileencoding='utf-8',
    title=true,
    backup=false,
    mouse="a",
    laststatus=2,
    visualbell=true,
    wildmenu=true,
    conceallevel=0,
    completeopt={"menuone", "noselect"},
    timeoutlen=1000,
    updatetime=300,  -- faster completion
    writebackup=false,

    -- cmd
    showcmd=true,
    cmdheight=2,

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

    -- line wrapping
    wrap=true,
    linebreak=true,
    
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

    -- scroll off
    scrolloff=8,
    sidescrolloff=8,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
    -- clipboard
    vim.opt.clipboard:append("unnamedplus")
--    vim.opt.iskeyword:append("-")
    
