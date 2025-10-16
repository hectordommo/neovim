return {
  "gbprod/phpactor.nvim",
  build = function()
    require("phpactor.handler.update")()
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function ()
    local actor = require('phpactor')
    -- Skip setup to avoid deprecated lspconfig API
    -- Phpactor LSP is already configured via mason-lspconfig in lsp.lua
    actor.setup({
      lspconfig = {
        enabled = false  -- Disable lspconfig integration
      }
    })
  end
}
