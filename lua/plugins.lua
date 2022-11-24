require('settings')
vim.cmd.packadd("packer.nvim")

-- local use = require('packer').use

return require('packer').startup(function()
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
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'glepnir/lspsaga.nvim' -- LSP UI's
	use {'windwp/nvim-autopairs', run=function() require('nvim-autopairs').setup{} end}
	
	-- colorscheme or themes
	use 'norcalli/nvim-colorizer.lua'
	use 'folke/tokyonight.nvim'
	end)
