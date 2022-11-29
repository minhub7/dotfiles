-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    open_on_setup = true,
    open_on_setup_file = true,
    view = {
        adaptive_size = true,
        mappings = { list = {{ key="u", action="dir_up" }}},
    },
    renderer = {
        group_empty = true,
    },
    filters = { dotfiles = true },
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "rust", "python", "lua" },  -- A list of parser names, or "all"

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  ignore_install = { },  -- List of parsers to ignore installing (for "all")

  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    disable = {},  -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}

require('telescope').setup{
    defaults = { mappings = { i = {} } },
    pickers = { find_files={ theme="dropdown" } },
    extensions = {}
}

