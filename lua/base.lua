vim.scriptencoding = 'utf-8'

-- vim.wo.number = true
-- vim.wo.colorcolumn = 120

local options = {
    encoding='utf-8',
    fileencoding='utf-8',
    title=true,
    backup=false,
    number=true,
    mouse="a",
    autoindent=true,
    smartindent=true,
    smarttab=true,
    hlsearch=true,
    showcmd=true,
    cmdheight=2,
    tabstop=4,
    shiftwidth=4,
    expandtab=true,
    cursorline=true,
    scrolloff=8,
    termguicolors=true,
    backspace={'start', 'eol', 'indent'},
    laststatus=2,
    visualbell=true,
    wildmenu=true,
    smartcase=true,
    ignorecase=true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


