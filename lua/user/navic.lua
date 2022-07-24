local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end


require("lspconfig").tsserver.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

-- Lualine setup is at lualine.lua
