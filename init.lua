vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  }
})


require "user.options"
require "user.keymaps"
require "config.lazy"
require "config.personalize"
require "user.functions"
-- require "user.cmp"
-- require "user.lsp"
-- require "user.mason"
-- require "user.markid"    -- Decorate variable
-- require "user.treesitter"
-- require "user.lsp-signature"
-- require "user.autopairs"
-- require "user.bufferline"
-- require "user.telescope"
-- require "user.neoscroll"
-- require "user.comment"
-- require "user.gitsigns"
-- require "user.lualine"
-- require "user.nvim-tree"
-- require "user.neoclip"
-- require "user.illuminate"
-- require "user.blankline"
-- require "user.sonokai"   -- theme
-- require "user.tagbar"    -- code navigation
-- require "user.harpoon"   -- code navigation
-- require "user.floaterm"  -- Floaterm config
-- require "user.alignmini" -- align text
-- require "user.leap"      -- Jump to word
-- require "user.undotree"  -- Undo tree
-- require "user.laravel"   -- laravel helper
-- require "user.treesitter-context"   -- laravel helper
-- require "user.auto-session"     -- Database managment
-- require "user.better-ts-errors"     -- Better format for typescript errrors


