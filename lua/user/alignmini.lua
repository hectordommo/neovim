-- Setup MINI automatic align tool
local status_ok, ref = pcall(require, "refactoring")
if not status_ok then
  return
end

ref.setup()
