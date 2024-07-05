return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "David-Kunz/markid"
  },
  config = function()
    local m = require('markid')
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vim",
        "c",
        'php',
        'tsx',
        'typescript',
        "json",
        "lua",
        "css"
      },
      autopair = {
        enable = true
      },
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { "help" },
      },
      markid = {
        enable = true,
        colors = m.colors.medium,
        queries = {
          default = '(identifier) @markid',
          tsserver = [[
          (identifier) @markid
          (property_identifier) @markid
          (shorthand_property_identifier_pattern) @markid
          ]],
          javascript = [[
          (identifier) @markid
          (property_identifier) @markid
          (shorthand_property_identifier_pattern) @markid
          ]],
          php = [[
          (variable_name) @markid
          ]]
        }
      },
    })
  end
}

