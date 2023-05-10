local configs = require("nvim-treesitter.configs")
local m = require( 'markid' )

configs.setup {
  -- ensure_installed = "maintained",
  ensure_installed = {
        'php',
        'phpdoc',
        'javascript',
        'typescript',
        'css',
        'json',
        'prisma',
        'tsx', 'vue', 'html', 'lua'
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
    }
}
m.colors = {
    dark = { "#619e9d", "#9E6162", "#81A35C", "#7E5CA3", "#9E9261", "#616D9E", "#97687B", "#689784", "#999C63", "#66639C" },
    bright = {"#f5c0c0", "#f5d3c0", "#f5eac0", "#dff5c0", "#c0f5c8", "#c0f5f1", "#c0dbf5", "#ccc0f5", "#f2c0f5", "#98fc03" },
    medium = { "#c99d9d", "#c9a99d", "#c9b79d", "#c9c39d", "#bdc99d", "#a9c99d", "#9dc9b6", "#9dc2c9", "#9da9c9", "#b29dc9" }
}
-- code foinding
-- :qvimvim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


