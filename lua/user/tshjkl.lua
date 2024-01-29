local status_ok, tshjkl = pcall(require, "tshjkl")
if not status_ok then
  return
end


tshjkl.setup {
  keymaps = {
    select_current_node = true,
    toggle = '<C-v>'
  }
}
