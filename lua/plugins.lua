local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd.packadd("packer.nvim")
end

-- Autocommand taht reloads neovim
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])


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
	use 'wbthomason/packer.nvim'  -- Package manager

	-- common
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use {'nvim-treesitter/nvim-treesitter', run=function() require('nvim-treesitter.install').update({ with_sync=ture }) end}  -- configurations for nvim-treesitter
	use {'nvim-tree/nvim-tree.lua', requires={ 'nvim-tree/nvim-web-devicons' }, tag='nightly'}  -- configurations for nvim-tree (file explorer/in sidebar)
    use {'romgrk/barbar.nvim', wants='nvim-web-devicons'}
    use {'nvim-telescope/telescope.nvim', tag='0.1.0', requires={ 'nvim-lua/plenary.nvim' }}  -- configurations for fuzzy finder (file explorer)
    use {'nvim-lualine/lualine.nvim', requires={ 'kyazdani42/nvim-web-devicons', opt=true }}
    use {'akinsho/toggleterm.nvim', tag='*', config=function() require('toggleterm').setup() end}

	-- Utilities
	-- use {'iamcco/markdown-preview.nvim', run=function() vim.fn['mkdp#util#install']() end}  -- markdown preview on local website
	use 'lukas-reineke/indent-blankline.nvim'
	use 'plasticboy/vim-markdown'

	-- configurations for auto completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use {'windwp/nvim-autopairs', run=function() require('nvim-autopairs').setup{} end}

    -- LSP
	use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
	use 'glepnir/lspsaga.nvim' -- LSP UI's

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

	-- colorscheme or themes
    use 'norcalli/nvim-colorizer.lua'
	use 'folke/tokyonight.nvim'

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
