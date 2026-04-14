-- Find the vault path that exists on this system
local vault_path
local possible_paths = {
  "~/Projects/brains/",
  "~/Documents/hectors-brain-md",
  os.getenv("OBSIDIAN_VAULT_PATH"),
}

for _, path in ipairs(possible_paths) do
  if path then
    local expanded = vim.fn.expand(path)
    if vim.fn.isdirectory(expanded) == 1 then
      vault_path = path
      break
    end
  end
end

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    enabled = vault_path ~= nil,
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = vault_path and {
      {
        name = "personal",
        path = vault_path,
      }
    } or {},
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
