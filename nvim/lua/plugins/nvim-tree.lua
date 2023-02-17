-- disable netrw at the very start of your init.lua (strongly advised)
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    return
end

-- local config_status, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status then
--     return
-- end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
    disable_netrw = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    view = {
        adaptive_size = true,
        mappings = { list = {{ key="u", action="dir_up" }}},
    },
    renderer = {
        highlight_git = true,
        group_empty = true,
    },
    filters = { dotfiles = true },
}

