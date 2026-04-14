return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/Projects/brains/",
      }
    },
    ui = {
      enable = false
    },
    frontmatter = {enabled = true,
    func = function() 
      return {} -- do not add any default frontmatter to a note on save
    end
  },
    templates = {
      enabled = true,
      folder = "3 Recursos/Templates",
    }
  },
}
