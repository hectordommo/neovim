-- local status_ok, tagbar = pcall(require, "tagbar")
-- if not status_ok then
--   return
-- end


local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>z", ":TagbarToggle<cr>", opts)
