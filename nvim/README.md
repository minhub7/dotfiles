# Configurations for Neovim
<img src="https://upload.wikimedia.org/wikipedia/commons/4/4f/Neovim-logo.svg" width="200px" title="Neovim"/>

as IDE for python and deep learning development
<br><br>

## Structures
```
.
├── README.md
└── nvim
    ├── init.lua
    └── lua
        ├── setup.lua  (install plugins using packer.nvim)
        ├── core
        │   ├── init.lua
        │   ├── colorscheme.lua
        │   ├── keymaps.lua
        │   └── options.lua
        ├── lsp  (for language server protocol)
        │   ├── init.lua
        │   ├── handlers.lua
        │   ├── installer.lua
        │   ├── lspsaga.lua
        │   ├── mason.lua
        │   ├── null-ls.lua
        │   └── settings  (lsp server setting files)
        └── plugins  (details for various plugins)
            ├── init.lua
            ├── autopairs.lua
            ├── barbar.lua
            ├── comment.lua
            ├── completion.lua
            ├── gitsigns.lua
            ├── indentline.lua
            ├── lualine.lua
            ├── neovide.lua
            ├── nvim-tree.lua
            ├── telescope.lua
            ├── toggle-term.lua
            ├── toggleterm.lua
            ├── treesitter.lua
            └── which-key.lua
```

## Getting Started
### in Ubuntu
#### Requirements
- snap
- Nodejs
- Neovim (>=0.8)
- Copilot (optional)

#### Install neovim
Using snap
```SHELL
sudo apt-get install snap
snap install nvim --classic
```
or
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install neovim -y
```

## Plugins
These configuration files are written in lua  
Using packer.nvim, start ":PackerInstall" and ":PackerSync" in neovim

#### Plugin manager
- wbthomason/packer.nvim

#### Commons & Utilities
- nvim-lua/popup.nvim
- nvim-lua/plenary.nvim
- numToStr/Comment.nvim  (make use comment more easily plugins)
- nvim-lualine/lualine.nvim  (status line plugins)
- akinsho/toggleterm.nvim  (terminal plugins)
- romgrk/barbar.nvim  (winbar plugins)
- tpope/vim-surround  (change surroundings plugins)

#### Colorscheme
- EdenEast/nightfox.nvim  (carbonfox)

#### File Explorer & Fuzzy finder
- nvim-tree/nvim-tree.lua
- nvim-telescope/telescope.nvim
- nvim-telescope/telescope-media-files.nvim

#### Auto completion
- hrsh7th/nvim-cmp
- hrsh7th/cmp-buffer
- hrsh7th/cmp-path
- hrsh7th/cmp-cmdline
- hrsh7th/cmp-nvim-lsp
- hrsh7th/cmp-nvim-lua
- tzachar/cmp-tabnine
- windwp/nvim-autopairs
- saadparwaiz1/cmp_luasnip

#### LSP configuration
- neovim/nvim-lspconfig
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim
- jose-elias-alvarez/null-ls.nvim
- glepnir/lspsaga.nvim

#### Snippets
- L3MON4D3/LuaSnip
- rafamadriz/friendly-snippets

#### Syntax Highlighting
- nvim-treesitter/nvim-treesitter
- p00f/nvim-ts-rainbow
- nvim-treesitter/playground
- JoosepAlviste/nvim-ts-context-commentstring
- lukas-reineke/indent-blankline.nvim'
- RRethy/vim-illuminate

#### Git & markdown
- wis6991/gitsigns.nvim
- iamcco/markdown-preview.nvim

