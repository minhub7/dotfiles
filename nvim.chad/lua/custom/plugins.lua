local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  -- better-escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code Analysis
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {
        width = 15,
      }
    end,
    keys = {
      { "<leader><Tab>", "<cmd>SymbolsOutline<CR>" },
    },
  },

  -- go to preview
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 120,
        height = 40,
      }
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    lazy=false,
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = overrides.copilot,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = overrides.cmp,
  },

  -- flutter
  {
    'akinsho/flutter-tools.nvim',
    lazy=false,
    dependencies={
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    opts={},
  }

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

require("cmp").event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)

require("cmp").event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)

return plugins
