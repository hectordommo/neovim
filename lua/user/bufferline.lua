local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup ({
  options = {
    style_preset = bufferline.style_preset.minimal,
    --mode = 'tabs',
    numbers = "none",                        -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    themable = true,
    close_command = "Bdelete! %d",           -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d",     -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",        -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,              -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      icon = "▎",
      style = 'underline',
    },
    buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 20,
    max_prefix_length = 20,
    tab_size = 20,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 }
    },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = false,     -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",     -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  highlights = {
    separator = {
      guifg = '#073642',
      guibg = '#002b36'
    },
    separator_selected = {
      guifg = '#073642',
      guibg = '#002b36'
    },
    background = {
      guibg = '#657b83',
      guifg = '#002b36'
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      gui = 'bold'
    },
    fill = {
      guibg = '#073642',
    }
  }
})
