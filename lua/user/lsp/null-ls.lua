local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

--     formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },

null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.diagnostics.eslint,

    -- formatting.phpcsfixer,
    -- formatting.black.with { extra_args = { "--fast" } },
    -- formatting.yapf,
    -- formatting.stylua,
    -- diagnostics.flake8,
  },
}


