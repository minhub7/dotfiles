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

