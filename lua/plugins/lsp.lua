return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function() 
    local status_ok, lsp_installer = pcall(require, "mason")
    if not status_ok then
      return
    end
    local status_ok, lspconfig = pcall(require, "lspconfig")
    if not status_ok then
      return
    end
    local cmp_status_ok, cmp = pcall(require, "cmp_nvim_lsp")
    if not cmp_status_ok then
      return
    end

    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "tsserver",
        "emmet_ls",
        "jsonls",
        "prismals",
        "tailwindcss",
        "phpactor",
        "cssls"
      },
      highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
      handlers = {
        function(server_name)
          local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp.default_capabilities() -- attach lsp-cmp completions 
          )
          lspconfig[server_name].setup({
            capabilities = capabilities
          })
        end
        }

    })

--     vim.api.nvim_create_autcmd('LspAttach', {
--       callback = function(ev)
--         local opts = { noremap = true, silent = true }
--         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--         vim.api.nvim_buf_set_keymap(ev.buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--       end
--     })
  end
}
