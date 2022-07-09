local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end


require("lspconfig").javascript.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

require("lualine").setup({
    sections = {
        lualine_z = {
            {
                navic.get_location,
                cond = navic.is_available
            },
        }
    }
})
