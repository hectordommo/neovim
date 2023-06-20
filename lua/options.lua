-- This file is loaded by init
vim.laststatus = 3
vim.o.laststatus = 3
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.expandtab = true
vim.opt.numberwidth = 3
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.mouse = "ni"
vim.opt.showmatch  = true       -- Highlights the matching parenthesis
vim.opt.termguicolors = true    -- Required for some themes
-- vim.opt.signcolumn = "yes"    -- Always show the signcolumn
vim.opt.hidden = true           -- Allow multple buffers
vim.opt.encoding = "utf-8"      -- Just in case
vim.opt.fileencoding = "utf-8"
vim.opt.showtabline = 2
vim.opt.cmdheight=1             -- Shows better messages
vim.opt.fileencoding = "utf-8"  -- the encoding written to a file
vim.opt.updatetime = 200        -- faster completion (4000ms default)
vim.opt.cursorline = true
vim.opt.scrolloff = 3
vim.opt.clipboard = 'unnamedplus'
vim.o.guifont = "Hack Nerd Font Mono"
vim.o.incsearch = true

-- Keymaps timeouts
vim.opt.ttimeoutlen = 100
