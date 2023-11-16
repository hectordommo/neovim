local status_ok, blankline = pcall(require, "ibl")
if not status_ok then
  return
end

vim.opt.list = true
blankline.setup {
  indent = { highlight = highlight, char = "" },
--  show_current_context = true,
--  show_current_context_start = true,
}
