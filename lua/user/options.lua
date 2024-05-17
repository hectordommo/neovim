-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = false                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
-- vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 200                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- Sets the number of spaces to use for each step of (auto)indent.
vim.opt.softtabstop = 2                         -- Controls the number of spaces a tab counts for while performing editing operations, like inserting a tab.
vim.opt.tabstop = 2                             -- with of the spaces for a tab

vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                  -- set relative numbered lines
vim.opt.numberwidth = 3                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- show the sign column, otherwise would shift the text each time

vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 4                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

-- Code folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
--

-- Function to toggle between 4 and 2 spaces for tab size
function ToggleTabSize()
  local current_tab_size = vim.api.nvim_get_option('tabstop')
  print('Current tabstop: ' .. current_tab_size)

  if current_tab_size == 4 then
    -- If currently using 4 spaces, switch to 2 spaces
    vim.api.nvim_set_option('tabstop', 2)
    vim.api.nvim_set_option('shiftwidth', 2)
    vim.api.nvim_set_option('softtabstop', 2)
    vim.api.nvim_set_option('expandtab', true)
    print('Switched to 2 spaces for tab size')
  else
    -- If currently using 2 spaces or any other size, switch to 4 spaces
    vim.api.nvim_set_option('tabstop', 4)
    vim.api.nvim_set_option('shiftwidth', 4)
    vim.api.nvim_set_option('softtabstop', 4)
    vim.api.nvim_set_option('expandtab', true)
    print('Switched to 4 spaces for tab size')
  end
end

