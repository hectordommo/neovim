local configs = require("nvim-treesitter.configs")
local m = require'markid'

configs.setup {
  -- ensure_installed = "maintained",
  ensure_installed = {
        'php',
        'typescript',
        'css',
        'json',
        'prisma',
        'tsx', 'vue', 'html'
    },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopair = {
	enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
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
	enable= true,
		-- disable = {"jsx", "cpp"}, -- list of languages you want to disable the pluginfor
	extended_mode = true,
	max_file_lines = nil, -- do not enable for files with more that n lines, int
	-- colors = {}
	-- termcolors = {} -- table of clour name strings
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  markid = {
        enable = true,
        queries = {
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
    }
}
-- code foinding
-- :qvimvim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


