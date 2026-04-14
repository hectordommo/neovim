return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Install parsers that should always be present
      vim.schedule(function()
        local parsers_to_install = {
          "vim", "vimdoc", "c", "lua",
          "php", "php_only",
          "tsx", "typescript", "javascript",
          "json", "css", "html", "markdown"
        }

        local ok, result = pcall(function()
          return require('nvim-treesitter').install(parsers_to_install):wait(300000)
        end)

        if not ok then
          vim.notify("Treesitter parser installation not available in this version", vim.log.levels.WARN)
        end
      end)

      -- Enable treesitter highlighting for all supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local ok = pcall(vim.treesitter.start)
          if not ok then
            -- parser not installed for this filetype, skip silently
          end
        end,
      })
    end
  },
  {
    -- markid is incompatible with nvim-treesitter v1.0+ (requires old configs module)
    "David-Kunz/markid",
    enabled = false,
  },
}
