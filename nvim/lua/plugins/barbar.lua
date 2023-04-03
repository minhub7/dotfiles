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
    tabpages = true,
    clickable = true,

    icons = {
        -- Configure the base icons on the bufferline.
        buffer_index = false,
        buffer_number = false,
        button = '',

        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
          [vim.diagnostic.severity.WARN] = {enabled = false},
          [vim.diagnostic.severity.INFO] = {enabled = false},
          [vim.diagnostic.severity.HINT] = {enabled = false},
        },
        filetype = {
          custom_colors = false,
          enabled = true, -- Requires `nvim-web-devicons` if `true`
        },
        separator = {left = '▎', right = ''},

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = {button = '●'},
        pinned = {button = '車'},

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = {filetype = {enabled = false}},
        current = {buffer_index = true},
        inactive = {button = '×'},
        visible = {modified = {buffer_number = false}},
    },

    insert_at_end = true,
}

