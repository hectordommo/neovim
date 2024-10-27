return {

  "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "themercorp/themer.lua",
  "chrisbra/Colorizer",
  "moll/vim-bbye",
  {
    "echasnovski/mini.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme sonokai")
      vim.g.colorscheme = "sonokai"
      vim.colorscheme = "sonokai"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = false,
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      require("which-key").setup({})
    end,
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
      "hrsh7th/cmp-cmdline",   -- cmdline completions
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "ray-x/cmp-treesitter",  -- treesitter autoccompletions
      "mlaursen/vim-react-snippets",
    },
    config = function()
      -- ...
    end,
  },
  -- Plugins to navigate or improve code navigation
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({ builtin_marks = { ".", "<", ">", "^" } })
    end,
  },
  { "easymotion/vim-easymotion",      lazy = true },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  "tpope/vim-surround",
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("null-ls").setup({ sources = require("null-ls").builtins.formatting.stylua })
    end,
  },
  "gabesoft/vim-ags",
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  { "OlegGulevskyy/better-ts-errors.nvim", lazy = true },
  { 
    "alexghergh/nvim-tmux-navigation", lazy = true,
    config = function()
      require'nvim-tmux-navigation'.setup ({
        disable_when_zoomed = true -- defaults to false
      })

      vim.keymap.set('n', "<CA-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<CA-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<CA-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<CA-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<CA-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<CA-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end
  },
  { "David-Kunz/markid",              lazy = true },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local comment = require("Comment")
      local jsx = require("ts_context_commentstring.integrations.comment_nvim")
      comment.setup({
        pre_hook = jsx.create_pre_hook(),
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = { floating_window = true },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function(_, opts)
      require("oil").setup(opts)
    end,
    keys = {
      {"-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    }
  },
}
