# Dev Environment Files for Neovim


## Contents
**Neovim config**
- init.lua 
- lua
    - core
        - colorscheme.lua
        - keymaps.lua
        - options.lua
    - lsp
        - settings (dir)
        - init.lua
        - handlers.lua
        - mason.lua
        - null-ls.lua
    - plugins
        - autopairs.lua
        - barbar.lua
        - comments.lua
        - completion.lua
        - gitsigns.lua
        - nvim-tree.lua
        - telescope.lua
        - treesitter.lua
    - setup.lua (setup plugins using packer.nvim)

## Neovim Setup
Requires Neovim (>=0.8)

### Installation

### Plugins
**Plugin Manager**
    - wbthomason/packer.nvim

Common
    - nvim-lua/popup.nvim
    - nvim-lua/plenary.nvim
    - numToStr/Comment.nvim

Colorscheme
    - norcalli/nvim-colorizer.lua
    - folke/tokyonight.nvim

File Explorer
    - nvim-tree/nvim-web-devicons
    - nvim-tree/nvim-tree.lua

Fuzzy Finder
    - nvim-telescope/telescope.nvim
    - nvim-telescope/telescope-media-files.nvim

Status line
    - vim-airline/vim-airline
    - vim-airline/vim-airline-themes
    - romgrk/barbar.nvim
    - nvim-lualine/lualine.nvim

Auto completion
    - hrsh7th/nvim-cmp
    - hrsh7th/cmp-buffer
    - hrsh7th/cmp-path
    - hrsh7th/cmp-cmdline
    - saadparwaiz1/cmp_luasnip
    - hrsh7th/cmp-nvim-lsp
    - hrsh7th/cmp-nvim-lua
    - windwp/nvim-autopairs

LSP configuration
    - neovim/nvim-lspconfig
    - williamboman/mason.nvim
    - williamboman/mason-lspconfig.nvim
    - jose-elias-alvarez/null-ls.nvim
    - glepnir/lspsaga.nvim

Snippets
    - L3MON4D3/LuaSnip
    - rafamadriz/friendly-snippets

Syntax Highlighting
    - nvim-treesitter/nvim-treesitter
    - p00f/nvim-ts-rainbow
    - nvim-treesitter/playground
    - JoosepAlviste/nvim-ts-context-commentstring
    - lukas-reineke/indent-blankline.nvim'

Terminal
    - akinsho/toggleterm.nvim

Git
    - lewis6991/gitsigns.nvim

---
To be added
    - tpope/vim-surround - manipulate surroundings with "ys", "ds", and "cs"
    - vim-scripts/ReplaceWithRegister - replace things with register with "gr"
    - iamcco/markdown-preview.nvim
