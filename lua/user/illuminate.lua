local status_ok, illuminate = pcall(require, "nvim-illuminate")
if not status_ok then
  return
end


require'lspconfig'.javascript.setup {
  on_attach = function(client)
    -- [[ other on_attach code ]]
    require 'illuminate'.on_attach(client)
  end,
}

