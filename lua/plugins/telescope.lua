return {
  "nvim-telescope/telescope.nvim",
  dependencies =  {
    "nvim-lua/plenary.nvim"
  },
  -- "nvim-telescope/telescope-fzf-native.nvim",
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end

    local actions = require "telescope.actions"
    local sorters = require "telescope.sorters"

    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local action_state = require "telescope.actions.state"

    -- Custom function picker
    local function custom_functions()
      -- Define your functions here
      local functions = {
        {
          name = "LSP Code Action",
          desc = "Show available code actions",
          func = function() vim.lsp.buf.code_action() end
        },
        {
          name = "LSP Rename",
          desc = "Rename symbol",
          func = function() vim.lsp.buf.rename() end
        },
        {
          name = "LSP Declaration",
          desc = "Go to declaration",
          func = function() vim.lsp.buf.declaration() end
        },
        {
          name = "Diagnostic Goto Previous",
          desc = "Go to previous diagnostic",
          func = function() vim.diagnostic.goto_prev() end
        },
        {
          name = "Diagnostic Goto Next",
          desc = "Go to next diagnostic",
          func = function() vim.diagnostic.goto_next() end
        },
        {
          name = "Format Document",
          desc = "Format current buffer",
          func = function() vim.lsp.buf.format() end
        },
        {
          name = "Reload Config",
          desc = "Reload Neovim configuration",
          func = function() 
            vim.cmd("source $MYVIMRC")
            print("Config reloaded!")
          end
        },
        {
          name = "Error description",
          desc = "Display current line error",
          func = function() vim.diagnostic.open_float(nil, { border = "rounded" }) end
        },
      }
      pickers.new({}, {
        prompt_title = "Custom Functions",
        finder = finders.new_table {
          results = functions,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry.name .. " - " .. entry.desc,
              ordinal = entry.name .. " " .. entry.desc,
            }
          end,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection and selection.value and selection.value.func then
              selection.value.func()
            end
          end)
          return true
        end,
      }):find()
    end

    telescope.setup( {
      defaults = {
        file_sorter = sorters.get_fzy_sorter,
        path_display = { "truncate" },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "webp", "jpg", "jpeg"},
          find_cmd = "ag" -- find command (defaults to `fd`)
        }
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    } )
    -- Make the custom function picker available globally
    _G.telescope_custom_functions = custom_functions
  end,
  keys = {
    {"<leader>s", "<cmd>Telescope lsp_document_symbols<cr>"},
    {"<leader>nj", "<cmd>Telescope current_buffer_fuzzy_find<cr>"},
    {"<leader>d", "<cmd>Telescope diagnostics<cr>"},
    {"<leader>gs", "<cmd>Telescope git_status<cr>"},
    {"<leader>f", "<cmd>Telescope git_files<cr>"},
    {"<leader>b", "<cmd>Telescope buffers<cr>"},
    {"<leader>tg", "<cmd>Telescope live_grep<cr>"},
    {"<leader>pf", "<cmd>Telescope find_files<cr>"},
    {"<leader>m", "<cmd>Telescope marks<cr>"},
    {"<leader>cp", "<cmd>Telescope neoclip<cr>"},
    {"<leader>Ws",
      function ()
        local builtin = require("telescope.builtin")
        local word = vim.fn.expand('<cWORD>')
        builtin.grep_string({search = word})
      end
    },
    -- Add the custom functions picker
    {"<leader>cd", function() _G.telescope_custom_functions() end, desc = "Custom Functions"},

  }
}

