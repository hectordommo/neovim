local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

-- Setup harpoon
local options = {noremap = true, silent = true, expr = false}
vim.api.nvim_set_keymap('n', "<Leader>hh", [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], options)
vim.api.nvim_set_keymap('n', "<Leader>ha", [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], options)
vim.api.nvim_set_keymap('n', "<Leader>h1", [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]], options)
vim.api.nvim_set_keymap('n', "<Leader>h2", [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]], options)
vim.api.nvim_set_keymap('n', "<Leader>h3", [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]], options)
vim.api.nvim_set_keymap('n', "<Leader>h4", [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], options)
