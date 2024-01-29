local status_ok, surfer = pcall(require, "syntax-tree-surfer")
if not status_ok then
  return
end
-- Syntax Tree Surfer
--
require("syntax-tree-surfer").setup({
})
local opts = {noremap = true, silent = true}
-- vim.keymap.set('n', "vx", function()  end)
-- vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
-- vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)

vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)

