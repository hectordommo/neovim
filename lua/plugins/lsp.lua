return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile"},
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

    local function lsp_highlight_document(client)
      -- Set autocommands conditional on server_capabilities
      -- https://sbulav.github.io/til/til-neovim-highlight-references/
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Clear All the References",
        })
      end
    end


    require("mason").setup()

    local on_attach = function (client, bufnr)
      print('server attached', client.name, client.server_capabilities.document_highlight)
      if client.name == "tsserver" then
        client.server_capabilities.document_formatting = true
      end
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', "gD", "<cmd>lua vim.lsp.buf.declaration()", opts)
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      vim.keymap.set("n", "<leader>td", "<cmd>Telescope lsp_definitions<CR>", opts)
      vim.keymap.set("n", "<leader>tt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      vim.api.nvim_create_user_command('Format', 'lua vim.lsp.buf.format()', {})
      vim.api.nvim_create_user_command('LspRename', 'lua vim.lsp.buf.rename()', {})
      -- if client.server_capabilities.document_highlight then
      --   lsp_highlight_document(client)
      -- end
      client.server_capabilities.document_formatting = true
    end

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "html",
        "tsserver",
        "emmet_ls",
        "jsonls",
        "prismals",
        -- "tailwindcss",
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
            capabilities = capabilities,
            on_attach = on_attach
          })
        end,
        ['tsserver'] = function()
          local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp.default_capabilities() -- attach lsp-cmp completions 
          )
          lspconfig.tsserver.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          })
        end
      }, --end handlers

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
