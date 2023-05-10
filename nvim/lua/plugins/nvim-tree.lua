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
    auto_reload_on_write = true,
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
        width = { min = 30, max = 30 },
        preserve_window_proportions = true,
    },
    renderer = {
        highlight_git = true,
        full_name = true,
    },
    git = {
        enable = true,
        ignore = false,
    },
    modified = {
        enable = true,
    }
}

