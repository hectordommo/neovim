return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    local status_ok, nullls = pcall(require, "mason-null-ls")
    if not status_ok then
      return
    end

    nullls.setup({
      ensure_installed = { "stylua", "jq" }
    })
  end
}

