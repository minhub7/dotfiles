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

local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

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


