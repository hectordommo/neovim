local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon.setup()

-- Setup harpoon
local options = {noremap = true, silent = true, expr = false}
vim.keymap.set('n', "<Leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', "<Leader>ha", function() harpoon:list():append() end)
vim.keymap.set('n', "<Leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set('n', "<Leader>h2", function() harpoon:list():select(2) end)
vim.keymap.set('n', "<Leader>h3", function() harpoon:list():select(3) end)
vim.keymap.set('n', "<Leader>h4", function() harpoon:list():select(4) end)
vim.keymap.set('n', "<Leader>h5", function() harpoon:list():select(5) end)
vim.keymap.set('n', "<Leader>h6", function() harpoon:list():select(6) end)

vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
