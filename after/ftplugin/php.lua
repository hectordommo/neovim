vim.opt_local.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4                             -- with of the spaces for a tab
vim.api.nvim_create_autocmd('php', {
  pattern = { '*.php' },
  callback = function() vim.treesitter.start() end,
})
