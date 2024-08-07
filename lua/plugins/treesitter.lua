return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "David-Kunz/markid",
    "EmranMR/tree-sitter-blade"
  },
  config = function()
    local m = require('markid')
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade"
    }

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vim",
        "c",
        'php',
        'php_only',
        'tsx',
        'typescript',
        'javascript',
        "json",
        "lua",
        "css",
        "blade"
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

