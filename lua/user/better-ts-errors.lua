-- Setup nvim-cmp.
local status_ok, errors = pcall(require, "better-ts-errors")
if not status_ok then
  return
end

errors.setup({
    keymaps = {
      toggle = '<leader>.e', -- Toggling keymap
      go_to_definition = '<leader>dx' -- Go to problematic type from popup window
    }
})
