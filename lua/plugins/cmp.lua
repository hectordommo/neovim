  return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",        -- cmdline completions
      "saadparwaiz1/cmp_luasnip",   -- snippet completions
      "ray-x/cmp-treesitter",      -- treesitter autoccompletions
      "mlaursen/vim-react-snippets",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end

      local kind_mapper = require('cmp.types').lsp.CompletitionItemKind
      local compare = require('cmp.config.compare')

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end

      require("luasnip/loaders/from_vscode").lazy_load()
      require("vim-react-snippets").lazy_load()

      local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end

      --   פּ ﯟ   some other good icons
      local kind_icons = {
        Class = "",
        Color = "󱊧",
        Constant = "",
        Comment = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "",
        File = "",
        Folder = "",
        Function = "",
        Interface = "",
        Keyword = "",
        Method = "m",
        Module = "",
        Operator = "",
        Property = "",
        Reference = "",
        Snippet = "󱈤",
        String = "",
        Struct = "",
        Text = "󰊄",
        TypeParameter = "",
        Unit = "",
        Value = "",
        Variable = "󰫧",
      }

      local kind_sorting_score = {
        Variable = 1,
        Class = 2,
        Method = 3,
        Keyword = 4,
      }

      -- find more here: https://www.nerdfonts.com/cheat-sheet

      cmp.setup ({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
              "i",
              "s",
            }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
              "i",
              "s",
            }),
        },
        formatting = {
          fields = { "kind", "abbr", "menu"},
          format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or vim_item.kind)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
              treesitter = "[TST]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = cmp.config.sources( {
          { name = "buffer" },
          { name = "nvim_lsp" },
          { name = "treesitter" },
          { name = "luasnip", Keyword_length = 3 },
          { name = "path" },
        } ),
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        -- sorting = {
        --   comparators = {
        --     compare.recently_used,
        --     function( entry1, entry2)
        --       local kind1 = kind_sorting_score[kind_mapper[entry1:get_kind()]] or 100
        --       local kind2 = kind_sorting_score[kind_mapper[entry2:get_kind()]] or 100
        --       if( kind1 < kind2) then
        --         return true
        --       end
        --     end
        --   }
        -- },
        experimental = {
          ghost_text = true,
          native_menu = false,
        },
      })
      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          })
      })


end,
  }

