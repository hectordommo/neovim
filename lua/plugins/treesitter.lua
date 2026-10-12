return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- Parsers that should always be present
      local parsers_to_install = {
        "vim", "vimdoc", "c", "lua",
        "php", "php_only",
        "tsx", "typescript", "javascript",
        "json", "css", "html", "markdown"
      }

      -- Only install what is actually missing. Calling install() on every
      -- startup rewrites site/parser/<lang>.so while vim.treesitter.start()
      -- below has already dlopen'd those same files; replacing a mapped,
      -- code-signed binary invalidates its pages and macOS then kills nvim
      -- with SIGKILL (CODESIGNING / "Invalid Page") a second after startup.
      local ok_cfg, ts_config = pcall(require, "nvim-treesitter.config")
      local installed = {}
      if ok_cfg then
        for _, lang in ipairs(ts_config.get_installed("parsers") or {}) do
          installed[lang] = true
        end
      end

      local missing = vim.tbl_filter(function(lang)
        return not installed[lang]
      end, parsers_to_install)

      if #missing > 0 then
        vim.schedule(function()
          local ok = pcall(function()
            return require("nvim-treesitter").install(missing)
          end)
          if not ok then
            vim.notify("Treesitter parser installation not available in this version", vim.log.levels.WARN)
          end
        end)
      end

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
