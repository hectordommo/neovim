return {
  "nvim-tree/nvim-tree.lua",
  config = function() 
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
      return
    end

    nvim_tree.setup({
      sort_by = "case_sensitive",
      auto_reload_on_write = true,
      view = {
        width = 35,
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
    })
  end,
  keys  = {
    {"<leader>e", ":NvimTreeToggle<cr>",'n',{noremap = true, silent = true }},
    {",c", '<cmd>NvimTreeCollapse<CR>', 'n', desc = 'Collapse file explorer'}


  }
}
