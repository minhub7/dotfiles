---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",
  },

  n = {
    ["<leader>b"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",

    -- tabufline
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",

    -- lspconfig
    ["<leader>f"] = "",

    -- nvim-tree
    ["<C-n>"] = "",
    ["<leader>e"] = "",

    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  },

  t = {
    ["<C-x>"] = "",

    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  v = {
  },
}

M.general = {
  n = {
    ["<tab>"] = { ">>", "Append indentation" },
    ["<S-tab>"] = { "<<", "Delete indentation" },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-x>"] = { "dd", "Cut current line" },

    -- window management
    ["-"] = { "<cmd> split <CR>", "Window horizontal split" },
    ["|"] = { "<cmd> vsplit <CR>", "Window vertical split" },
    ["se"] = { "<C-w>=", "Make window the same size" },
    ["sq"] = { "<cmd> close <CR>", "Quit window" },
    ["_"] = { "<cmd> vertical resize -2 <CR>", "Resize vertical window -2" },
    ["+"] = { "<cmd> vertical resize +2 <CR>", "Resize vertical window +2" },
    ["<PageUp>"] = { "<cmd> resize +2 <CR>", "Resize window +2" },
    ["<PageDown>"] = { "<cmd> resize -2 <CR>", "Resize window -2" },

  },

  t = {
    -- switch between windows
    ["<C-h>"] = { "<cmd> wincmd h <CR>", "Window left" },
    ["<C-l>"] = { "<cmd> wincmd l <CR>", "Window right" },
    ["<C-j>"] = { "<cmd> wincmd j <CR>", "Window down" },
    ["<C-k>"] = { "<cmd> wincmd k <CR>", "Window up" },

    ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<A-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<A-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- move to buffers of specific number
    ["<A-1>"] = {
      function()
        vim.api.nvim_set_current_buf(vim.t.bufs[1])
      end,
      "Goto first buffer",
    },

    ["<A-2>"] = {
      function()
        vim.api.nvim_set_current_buf(vim.t.bufs[2])
      end,
      "Goto second buffer",
    },

    ["<A-3>"] = {
      function()
        vim.api.nvim_set_current_buf(vim.t.bufs[3])
      end,
      "Goto third buffer",
    },

    -- close buffer + hide terminal buffer
    ["<A-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>d"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<F1>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>n"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<F2>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<F3>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<F4>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<F2>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<F3>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<F4>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    ["<F9>"] = {
      function()
        require("nvterm.terminal").send("python3 " .. vim.fn.expand "%", "float")
        require("nvterm.terminal").toggle "float"
      end,
      "Run python3 file in floating term",
    },

    -- new
    ["<leader>-"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>|"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.GotoPreview = {
  n = {
    ["gpd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "goto definition" },
    ["gpt"] = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "goto type definition" },
    ["gpi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "goto implementation" },
    ["gpr"] = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "goto references" },
    ["gq"] = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "all preview windows close" },
  },
}

return M
