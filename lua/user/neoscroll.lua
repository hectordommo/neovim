
local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

-- https://github.com/karb94/neoscroll.nvim


neoscroll.setup()
