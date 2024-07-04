local configs = require("nvim-treesitter.configs")
local m = require('markid')

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

configs.setup {
  -- ensure_installed = "maintained",
  ensure_installed = {
    'css',
    'html',
    'javascript',
    'json',
    'lua',
    'phpdoc',
    'prisma',
    'php',
    'tsx',
    'typescript',
    'vue',
},
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopair = {
    enable = true
  },
  highlight = {
    enable = true,    -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,

  },
  indent = { enable = true, disable = { "yaml" } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
    }
  },
  rainbow = {
    enable = true,
    -- disable = {"jsx", "cpp"}, -- list of languages you want to disable the pluginfor
    extended_mode = true,
    max_file_lines = nil, -- do not enable for files with more that n lines, int
    -- colors = {}
    -- termcolors = {} -- table of clour name strings
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
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [">m"] = "@function.outer",
        ["]o"] = "@loop.*",
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        --[[ ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" }, ]]
        --[[ ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" }, ]]
      },
      goto_previous_start = {
        ["<m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      ["]d"] = "@conditional.outer",
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
      }
    },
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ['@parameter.outer'] = 'v',     -- charwise
      ['@function.outer'] = 'V',      -- linewise
      ['@class.outer'] = '<c-v>',     -- blockwise
    },
  }
}
m.colors = {
  dark = { "#619e9d", "#9E6162", "#81A35C", "#7E5CA3", "#9E9261", "#616D9E", "#97687B", "#689784", "#999C63", "#66639C" },
  bright = { "#f5c0c0", "#f5d3c0", "#f5eac0", "#dff5c0", "#c0f5c8", "#c0f5f1", "#c0dbf5", "#ccc0f5", "#f2c0f5", "#98fc03" },
  medium = { "#c99d9d", "#c9a99d", "#c9b79d", "#c9c39d", "#bdc99d", "#a9c99d", "#9dc9b6", "#9dc2c9", "#9da9c9", "#b29dc9" }
}
-- code foinding
-- :qvimvim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--
--


local status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not status_ok then
    return
end
if status_ok then
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  print('setup up blade')
  parser_config.blade = {
      install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = {"src/parser.c"},
          branch = "main",
      },
      filetype = "blade"
  }

  vim.filetype.add({
      pattern = {
          ['.*%.blade%.php'] = 'blade',
      }
  })

end
