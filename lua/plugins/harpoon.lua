return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      {
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
          key = function()
            return vim.loop.cwd()
          end,
        }
      },
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      }
    })
    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')

  end,

  keys = {
    {"<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "harpoon file" },
    {"<Leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end},
    {"<Leader>ha", function() require("harpoon"):list():add() end},
    {"<Leader>h1", function() require("harpoon"):list():select(1) end},
    {"<Leader>h2", function() require("harpoon"):list():select(2) end},
    {"<Leader>h3", function() require("harpoon"):list():select(3) end},
    {"<Leader>h4", function() require("harpoon"):list():select(4) end},
    {"<Leader>h5", function() require("harpoon"):list():select(5) end},
    {"<Leader>h6", function() require("harpoon"):list():select(6) end},
    {"<Leader>h7", function() require("harpoon"):list():select(7) end},
  }
}
