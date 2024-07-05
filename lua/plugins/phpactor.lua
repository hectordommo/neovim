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
    actor.setup({})
    actor.rpc('context_menu', {})
  end
}
