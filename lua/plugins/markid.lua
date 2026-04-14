return {
  "David-Kunz/markid",
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  enabled = false,
  config = function ()
    local m = require'markid'
    require'nvim-treesitter.configs'.setup({
      markid = { 
        enable = true,
      }
    })
    m.queries = {
      default = '(identifier) @markid',
      javascript = [[
      (identifier) @markid
      (property_identifier) @markid
      (shorthand_property_identifier_pattern) @markid
      ]],
      php = [[
      (variable_name) @markid
      ]]
    }
    m.queries.typescript = m.queries.javascript
  end
}
