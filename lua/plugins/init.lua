return {

  "nvim-lua/popup.nvim",      -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",    -- Useful lua functions used ny lots of plugins
  "themercorp/themer.lua",
  {
    "sainnhe/sonokai", 
    lazy = false, 
    priority = 1000,
    config = function() 
      vim.cmd "colorscheme sonokai"
      vim.g.colorscheme = 'sonokai'
      vim.colorscheme = 'sonokai'
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require('which-key').setup({})
    end
  },
  "kyazdani42/nvim-web-devicons",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- cmp plugins
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",        -- cmdline completions
      "saadparwaiz1/cmp_luasnip",   -- snippet completions
      "ray-x/cmp-treesitter",      -- treesitter autoccompletions
      "mlaursen/vim-react-snippets",
    },
    config = function()
      -- ...
    end,
  },
  -- Plugins to navigate or improve code navigation
  {"kshenoy/vim-signature", lazy = true},
  {"easymotion/vim-easymotion", lazy = true},
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {"karb94/neoscroll.nvim", config = function() require('neoscroll').setup() end},
  "tpope/vim-surround",
  {
    "nvimtools/none-ls.nvim", 
    config = function() require("null-ls").setup({ sources= require("null-ls").builtins.formatting.stylua}) end 
  },
  "gabesoft/vim-ags",
  {  
    "AckslD/nvim-neoclip.lua", 
    config = function()
      require('neoclip').setup()
    end
  },
  {"christoomey/vim-tmux-navigator", lazy = true},
  { "David-Kunz/markid", lazy = true },
  "numToStr/Comment.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {floating_window = true},
    config = function(_, opts) require'lsp_signature'.setup(opts) end
  }
}
-- "nvim-tree/nvim-tree.lua",
-- "JoosepAlviste/nvim-ts-context-commentstring",
-- "RRethy/vim-illuminate",
-- "ray-x/lsp_signature.nvim",
-- "gabesoft/vim-ags",                      -- silver search,
-- "lukas-reineke/indent-blankline.nvim",   -- Indent lines guides,
-- "preservim/tagbar",                      -- Display a methods bar,
--                 -- better formating,
-- "jay-babu/mason-null-ls.nvim",
-- 
-- "chrisgrieser/nvim-spider",
-- "ziontee113/syntax-tree-surfer",
