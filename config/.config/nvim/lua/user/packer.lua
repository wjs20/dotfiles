local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)

    use "wbthomason/packer.nvim"

    use { "simrat39/symbols-outline.nvim" }
    use { "numToStr/Comment.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "tpope/vim-fugitive" }
    use { "mbbill/undotree" }
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    -- use { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} }
    use { "ellisonleao/gruvbox.nvim" }
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
    use { "kylechui/nvim-surround", tag = "*"}
    use { "windwp/nvim-autopairs" }
    use { "norcalli/nvim-colorizer.lua" }

    -- Configurations for Nvim LSP
    use { "neovim/nvim-lspconfig" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/nvim-cmp" }
    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
