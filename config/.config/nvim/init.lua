local o = vim.opt
o.scrolloff = 10
o.backup = false
o.cursorline = true
o.number = true
o.relativenumber = true
o.wrap = false
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
o.swapfile = false
o.incsearch = true
o.hlsearch = false
o.showmatch = true
o.termguicolors = true
o.syntax = 'on'
o.signcolumn = 'yes'
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

vim.g.mapleader = ' '
local map = vim.keymap.set
map('n', '<leader>h', '<cmd>wincmd h<cr>')
map('n', '<leader>j', '<cmd>wincmd j<cr>')
map('n', '<leader>k', '<cmd>wincmd k<cr>')
map('n', '<leader>l', '<cmd>wincmd l<cr>')
map('n', '<leader>ff', '<cmd>Files<cr>')
map('n', '<leader>fg', '<cmd>GFiles<cr>')
map('n', '<leader>fa', '<cmd>Ag<cr>')
map('n', 'B', '^')
map('n', 'E', '$')
map('n', '$', '<nop>')
map('n', '^', '<nop>')
-- map('v', 'f', '!black -q -l 30 --fast - <cr>')

require('colourscheme')
require('statusline')
require('treesitter')
require('_telescope')
require('_lspconfig')

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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tanvirtin/monokai.nvim'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use "nvim-lua/plenary.nvim"
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0'
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


