local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
	return
end
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"lua_ls", "html", "tsserver", "emmet_ls", "jsonls", "prismals", "tailwindcss"}
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.phpactor.setup {
    capabilities = require("user.lsp.handlers").capabilities,
	on_attach = require("user.lsp.handlers").on_attach
}

--[[ lspconfig.intelephense.setup { ]]
--[[     capabilities = require("user.lsp.handlers").capabilities, ]]
--[[ 	on_attach = require("user.lsp.handlers").on_attach ]]
--[[ } ]]

lspconfig.tsserver.setup { 
    capabilities = require("user.lsp.handlers").capabilities,
	on_attach = require("user.lsp.handlers").on_attach,
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
}

lspconfig.lua_ls.setup { 
    capabilities = require("user.lsp.handlers").capabilities,
	on_attach = require("user.lsp.handlers").on_attach,
    filetypes = {"lua"},
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lspconfig.tailwindcss.setup { 
    capabilities = require("user.lsp.handlers").capabilities,
	on_attach = require("user.lsp.handlers").on_attach
}

lspconfig.emmet_ls.setup { 
    capabilities = capabilities,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
	on_attach = require("user.lsp.handlers").on_attach,
    --[[ init_options = { ]]
    --[[   html = { ]]
    --[[     options = { ]]
    --[[       -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267 ]]
    --[[       ["bem.enabled"] = true, ]]
    --[[     }, ]]
    --[[   }, ]]
    --[[ } ]]
}
--[[ lspconfig.phpcs.setup() ]]
