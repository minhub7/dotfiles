local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size() return require'nvim-tree.view'.View.width end

nvim_tree_events.subscribe('TreeOpen', function() bufferline_api.set_offset(get_tree_size()) end)
nvim_tree_events.subscribe('Resize', function() bufferline_api.set_offset(get_tree_size()) end)
nvim_tree_events.subscribe('TreeClose', function() bufferline_api.set_offset(0) end)

bufferline.setup {
    animation = true,
    auto_hide = false,
    tabpages = false,
    closable = true,
    clickable = true,
    -- Configure icons on the bufferline.
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_end = true,
}

