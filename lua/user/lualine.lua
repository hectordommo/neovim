
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- http://neovimcraft.com/plugin/nvim-lualine/lualine.nvim/index.html
--

local navic = require("nvim-navic")

lualine.setup {
    options = {
        icons_enable= true,
        show_filename_only = false,
        globalstatus = true,
        sections = {
            lualine_b = {
                show_filename_only = false
            },
            lualine_c = {
                show_filename_only = false
            }
        },
    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = 2,
                path = 1
            }
        }
    }
}

-- require("lualine").setup({
--     sections = {
--         lualine_c = {
--             {
--                 navic.get_location,
--                 cond = navic.is_available
--             },
--         }
--     }
-- })
-- 
--        lualine_c = {'location', 'filename'},
