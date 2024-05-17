local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
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

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  --
  use "wbthomason/packer.nvim"   -- Have packer manage itself
  use "nvim-lua/popup.nvim"      -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"    -- Useful lua functions used ny lots of plugins
  use { "folke/which-key.nvim", config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup {}
  end
  }   -- helper to see keymaps

  -- themes
  use "sainnhe/sonokai"
  use "themercorp/themer.lua"
  use { "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim" } }
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzf-native.nvim"
  use "windwp/nvim-autopairs"   -- autopair plugin
  use "kyazdani42/nvim-web-devicons"
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  use "moll/vim-bbye"   -- Delete buffers and close files in Vim without closing your windows
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- cmp plugins
  use "hrsh7th/nvim-cmp"           -- The completion plugin
  use "hrsh7th/cmp-buffer"         -- buffer completions
  use "hrsh7th/cmp-path"           -- path completions
  use "hrsh7th/cmp-cmdline"        -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"   -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"       -- Lsp completion
  use "ray-x/cmp-treesitter"       -- treesitter autoccompletions

  -- snippets
  use "L3MON4D3/LuaSnip"               --snippet engine
  use "rafamadriz/friendly-snippets"   -- a bunch of snippets to use

  -- LSP
  --[[ use "williamboman/nvim-lsp-installer" -- lang server installer ]]
  use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  -- use "p00f/nvim-ts-rainbow" -- Rainbow parentheses (config @ treesitter file)
  use "chrisbra/Colorizer"
  use "nvim-treesitter/nvim-treesitter-context"

  use({
    "utilyre/barbecue.nvim",   --A VS Code like winbar for Neovim
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",   -- optional dependency
    },
    after = "nvim-web-devicons",       -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup({
        symbols = {
          separator = ""

        },
        theme = {
          normal = { fg = "#c0caf5" },
          ellipsis = { fg = "#737aa2" },
          separator = { fg = "#737aa2" },
          modified = { fg = "#737aa2" },
          basename = { bold = true },
          context_function = { fg = "#2FB215" },
        },
        kinds = {
          Macro = "",
          Class = "פּ",
          Constructor = "",
          Field = "",
          Property = "",
          Method = "m",
          Function = "",

        }
      })
    end,
  })
  -- Plugins to navigate or improve code navigation
  use "kshenoy/vim-signature"
  use "easymotion/vim-easymotion"
  use "ggandor/leap.nvim"
  use "karb94/neoscroll.nvim"
  use "nvim-tree/nvim-tree.lua"
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "RRethy/vim-illuminate"
  use "ray-x/lsp_signature.nvim"
  use "gabesoft/vim-ags"                      -- silver search
  use "lukas-reineke/indent-blankline.nvim"   -- Indent lines guides
  use "preservim/tagbar"                      -- Display a methods bar
  use "nvimtools/none-ls.nvim"                -- better formating
  use "jay-babu/mason-null-ls.nvim"
  use "David-Kunz/markid"
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use { "chrisgrieser/nvim-spider" }
  use { 'ziontee113/syntax-tree-surfer' }
  --[[ use({ ]]
  --[[   'ray-x/navigator.lua', ]]
  --[[   requires = { ]]
  --[[       { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }, ]]
  --[[       { 'neovim/nvim-lspconfig' }, ]]
  --[[   }, ]]
  --[[ }) ]]
  use({
    "dnlhc/glance.nvim",
    config = function()
      require('glance').setup({
        -- your configuration
      })
    end,
  })

  -- Code managment
  use "numToStr/Comment.nvim"
  use "tpope/vim-surround"
  use "AckslD/nvim-neoclip.lua"
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  use 'mbbill/undotree'
  use 'adalessa/laravel.nvim'
  use 'rmagatti/auto-session'
  -- PHP tools
  use 'gbprod/phpactor.nvim'
  use 'tpope/vim-dotenv'   -- allor for .env files
  use {                    -- packer
    'ccaglak/namespace.nvim',
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }
  -- /data base
  use 'tpope/vim-dadbod'
  -- Git
  use "lewis6991/gitsigns.nvim"

  -- terminal integration
  use "voldikss/vim-floaterm"

  -- NVIM dev plugings
  use "nvim-treesitter/playground"
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  use({
    'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup {
        -- options
      }
    end
  })

  -- Tux nav
  use "christoomey/vim-tmux-navigator"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
