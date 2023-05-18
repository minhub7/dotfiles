local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd.packadd("packer.nvim")
end

-- Protected call
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins
return require('packer').startup(function(use)
	use "wbthomason/packer.nvim"  -- Package manager

	-- common
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "numToStr/Comment.nvim"
    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua"  -- configurations for nvim-tree (file explorer/in sidebar)
    use "tpope/vim-surround"  -- add, delete, change surroundings

	-- Utilities
    -- Colorscheme
    use "EdenEast/nightfox.nvim"
    -- use "folke/tokyonight.nvim"

    -- Status
    use {"nvim-lualine/lualine.nvim", requires={ 'kyazdani42/nvim-web-devicons', opt=true }}
    use {"romgrk/barbar.nvim", wants='nvim-web-devicons'}

    -- Auto completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"
	use "windwp/nvim-autopairs"
    -- use {'tzachar/cmp-tabnine', run='./install.sh'}
    -- use {"zbirenbaum/copilot.lua", cmd="Copilot", event="InsertEnter", config=function() require("copilot").setup({}) end}
    -- use {"zbirenbaum/copilot-cmp", after={ "copilot.lua" }, config=function() require("copilot_cmp").setup({}) end}

    -- LSP
	use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
	use "glepnir/lspsaga.nvim" -- LSP UI's

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
	use "lukas-reineke/indent-blankline.nvim"

    -- terminal
    use {"akinsho/toggleterm.nvim", tag='*', config=function() require('toggleterm').setup() end}

    -- treesitter
    use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"}  -- configurations for nvim-treesitter
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "RRethy/vim-illuminate"

    -- telescope
    use "nvim-telescope/telescope.nvim"  -- configurations for fuzzy finder (file explorer)
    use "nvim-telescope/telescope-media-files.nvim"

    -- git & markdown
    use "lewis6991/gitsigns.nvim"
	use {'iamcco/markdown-preview.nvim', run=function() vim.fn['mkdp#util#install']() end}


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
