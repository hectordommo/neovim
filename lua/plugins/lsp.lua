return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile"},
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "mason-org/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim"
  },
  config = function()
    local status_ok, lsp_installer = pcall(require, "mason")
    if not status_ok then
      return
    end
    local status_ok1, lspconfig = pcall(require, "lspconfig")
    if not status_ok1 then
      return
    end
    local cmp_status_ok, cmp = pcall(require, "cmp_nvim_lsp")
    if not cmp_status_ok then
      return
    end
    require("mason-null-ls").setup({
        handlers = {},
    })
    print('lsp5')

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    --  this is deprecated - sign_define
    -- for _, sign in ipairs(signs) do
    --   vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    -- end
    

    local function lsp_highlight_document(client, bufnr)
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

    lsp_installer.setup()

    local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set

        -- Keymaps
        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "gD", vim.lsp.buf.declaration, opts)
        keymap("n", "gi", vim.lsp.buf.implementation, opts)
        keymap("n", "gr", vim.lsp.buf.references, opts)
        keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>e", function()
          vim.diagnostic.open_float(nil, { border = "rounded" })
        end, opts)
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap("n", "]d", vim.diagnostic.goto_next, opts)
      end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "html", "emmet_ls", "jsonls", "prismals", "tailwindcss", "phpactor", "cssls"
      },
      highlight = {
        enable = true,    -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
      automatic_enable = true,
      handlers = {
        function(server)
          -- print(server)
          lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      }
    })

    -- Setup servers

  end
}
