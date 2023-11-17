-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')
  use('burntsushi/ripgrep')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use ({
	  'nvim-telescope/telescope.nvim', tag = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })
  use ({'catppuccin/nvim', as='catppuccin'})
  use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
  use('nvim-treesitter/playground')
  use ('nvim-treesitter/nvim-treesitter-refactor')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-lualine/lualine.nvim')
  use ("christoomey/vim-tmux-navigator")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip', tag="v2.*"},
          {'saadparwaiz1/cmp_luasnip'}
	  }
  }
  use("jose-elias-alvarez/null-ls.nvim")
  use("MunifTanjim/prettier.nvim")
  use ("mfussenegger/nvim-dap")
  use ( 'simrat39/rust-tools.nvim' )
  use ("folke/neodev.nvim")
  use ({ "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} })
  use {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  }
  use ('leoluz/nvim-dap-go')
  use ('rcarriga/nvim-dap-ui')
  use('theHamsta/nvim-dap-virtual-text')
  use('nvim-telescope/telescope-dap.nvim')
  if packer_bootstrap then
    require('packer').sync()
  end
  end)
