return {
  "adalessa/laravel.nvim",

  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  config = function()
    local status_ok, laravel = pcall(require, "laravel")
    if not status_ok then
      print('No laravel loaded')
      return
    end

    laravel.setup({
      auto_dicover = true,
      bind_telescope = true,
      route_info = true,
      default_runner = "buffer",
      commands_runner = {
        ["dump-server"] = "persist",
        ["db"] = "terminal",
        ["tinker"] = "terminal",
        ["queue:listen"] = "persist",
        ["serve"] = "persist",
        ["websockets"] = "persist",
        ["queue:restart"] = "watch",
      },
      resources = {
        ["make:cast"] = "app/Casts",
        ["make:channel"] = "app/Broadcasting",
        ["make:command"] = "app/Console/Commands",
        ["make:component"] = "app/View/Components",
        ["make:controller"] = "app/Http/Controllers",
        ["make:event"] = "app/Events",
        ["make:exception"] = "app/Exceptions",
        ["make:factory"] = function(name)
          return string.format("database/factories/%sFactory.php", name), nil
        end,
        ["make:job"] = "app/Jobs",
        ["make:listener"] = "app/Listeners",
        ["make:mail"] = "app/Mail",
        ["make:middleware"] = "app/Http/Middleware",
        ["make:migration"] = function(name)
          local result = require("laravel.runners").sync { "fd", name .. ".php" }
          if result.exit_code == 1 then
            return "", result.error
          end

          return result.out, nil
        end,
        ["make:model"] = "app/Models",
        ["make:notification"] = "app/Notifications",
        ["make:observer"] = "app/Observers",
        ["make:policy"] = "app/Policies",
        ["make:provider"] = "app/Providers",
        ["make:request"] = "app/Http/Requests",
        ["make:resource"] = "app/Http/Resources",
        ["make:rule"] = "app/Rules",
        ["make:scope"] = "app/Models/Scopes",
        ["make:seeder"] = "database/seeders",
        ["make:test"] = "tests/Feature",
      }
    })
  end,
  keys = {
    {"<leader>a", ":Laravel artisan<cr>", {desc = 'Execute Laravel Artisan commands', silent = true}}
  }
}
