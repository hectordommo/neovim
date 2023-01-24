-- Setup nvim-cmp.
local status_ok, mini = pcall(require, "mini.align")
if not status_ok then
  return
end

mini.setup()
