--------------------------------------------------------------------------------
-- packer plugin Manager settings
--------------------------------------------------------------------------------
local packer = require('packer')

packer.init(
	{
		git = {
			clone_timeout = 120, -- Timeout, in seconds, for git clones
		},
	}
)

packer.startup(
	function()
		local use = use
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- opt stand for optional so it will loaded on-demand with the :packadd command.
		-- the following package will loaded only if file type is markdown.
		-- use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = {'markdown'}}

		-- Simple plugins can be specified as strings
		use 'mhinz/vim-startify'
		use 'vim-ctrlspace/vim-ctrlspace'
		use 'ryanoasis/vim-devicons'                            -- Provided graphical icon
		use 'sainnhe/artify.vim'                                -- Provided customizable font
		use 'itchyny/lightline.vim'
		use 'sainnhe/gruvbox-material'
		use 'morhetz/gruvbox'
		use 'sainnhe/everforest'
		use 'sainnhe/edge'

		-- Autocompletion plugins and LSP support
		use {'neoclide/coc.nvim', branch = 'release'}
		use 'honza/vim-snippets'                                -- Provide snippets for coc-snippets

		-- REPL and Debugger plugins
		use {'puremourning/vimspector', branch = 'master'}      -- Debugger plugin

		-- Helper plugins for productivity
		use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'tpope/vim-fugitive'                                -- The premier Git plugin for Vim, it is illegal.
		use 'norcalli/nvim-colorizer.lua'
		use 'terrortylor/nvim-comment'
		use 'AndrewRadev/splitjoin.vim'
		use "Pocco81/AutoSave.nvim"
		use 'lukas-reineke/indent-blankline.nvim'
	end
)


-- Set Options and Keymaps
require('options')
require('keymaps')

-- Load vimscript config
vim.cmd('source ~/.config/nvim/vim/coc-nvim.vim')
vim.cmd('source ~/.config/nvim/vim/vim-startify.vim')
vim.cmd('source ~/.config/nvim/vim/lightline.vim')
vim.cmd('source ~/.config/nvim/vim/markdown.vim')
vim.cmd('source ~/.config/nvim/vim/vimspector.vim')

-- Load lua plugins configurations
require('plugins-config/ts')
require('plugins-config/other')
require('plugins-config/blackline')
require('plugins-config/colorizer')
require('plugins-config/nvim-comment')
require('plugins-config/AutoSave')
