local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
  print('Error loading treesitter-context')
  return
end

context.setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 50, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 5, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 60, -- The Z-index of the context window
})
