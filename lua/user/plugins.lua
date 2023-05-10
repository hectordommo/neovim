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
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use { "folke/which-key.nvim", config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
        require("which-key").setup {}
    end
    }  -- helper to see keymaps

    -- themes
    use "sainnhe/sonokai"
    use "themercorp/themer.lua"
    -- use "EdenEast/nightfox.nvim"

    -- use {'neoclide/coc.nvim', branch = 'release'}
    use "nvim-telescope/telescope.nvim"
    use "windwp/nvim-autopairs" -- autopair plugin
    use "kyazdani42/nvim-web-devicons"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- Lsp completion

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

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
    use "p00f/nvim-ts-rainbow" -- Rainbow parentheses (config @ treesitter file)
    use "chrisbra/Colorizer"

    use({
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup({
                theme = {
                    ellipsis = { fg = "#737aa2" },
                    separator = { fg = "#737aa2" },
                    modified = { fg = "#737aa2" },
                    basename = { bold = true },
                },
                kinds = {
                    Macro = "",
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
    use "RRethy/vim-illuminate"
    use "ray-x/lsp_signature.nvim"
    use "gabesoft/vim-ags" -- silver search
    use "lukas-reineke/indent-blankline.nvim" -- Indent lines guides
    use "preservim/tagbar" -- Display a methods bar
    use "jose-elias-alvarez/null-ls.nvim" -- better formating
    use { "ThePrimeagen/harpoon", requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } } -- better formating
    use 'David-Kunz/markid'
    use 'nvim-treesitter/nvim-treesitter-context'
    use { "chrisgrieser/nvim-spider" }

    -- Code managment
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "tpope/vim-surround"
    use "AckslD/nvim-neoclip.lua"
    use { 'echasnovski/mini.nvim', branch = 'stable' }
    use 'mbbill/undotree'
    use 'adalessa/laravel.nvim'
    use 'gbprod/phpactor.nvim'
    --[[ use { ]]
    --[[     "ThePrimeagen/refactoring.nvim", ]]
    --[[     requires = { ]]
    --[[         {"nvim-lua/plenary.nvim"}, ]]
    --[[         {"nvim-treesitter/nvim-treesitter"} ]]
    --[[     } ]]
    --[[ }  ]]
    -- Refactoring tool
    -- Git
    use "lewis6991/gitsigns.nvim"

    -- terminal integration
    use "voldikss/vim-floaterm"

    -- NVIM dev plugings
    use "nvim-treesitter/playground"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
