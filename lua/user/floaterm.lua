

local options = {noremap = true, silent = true, expr = false}
vim.api.nvim_set_keymap('n', 
    "<Leader>ij", [[<Cmd>FloatermNew --height=0.8 --width=0.8 --wintype=float --name=git --position=center lazygit<CR>]], options)
