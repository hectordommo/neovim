local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
 keymap("", "<Space>", "<Nop>", opts)
 vim.g.mapleader = " "
 vim.g.maplocalleader = " "

--add another esc key bind
-- keymap("i", "<A-q>", "<ESC>", {})
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Regular save
keymap('n', '<c-s>', ':w<CR>', {})	  -- ctrl-save <- :w    : NORMAL
keymap('i', '<c-s>', '<ESC>:w<CR>', {})  -- ctrl-save < ESC :w : INSERT
-- keymap('i', '<c-s>', '<ESC>:w<CR>a', {})  -- ctrl-save < ESC :w : INSERT

-- Close buffer
keymap('n', '<c-w>', ':Bdelete<CR>', {})


-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", "<gv", opts)
keymap("v", "<", ">gv", opts)


-- Telescope
-- keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope git_files<cr>", opts)
-- Open buffers on telescope
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- Open live grep on telescope
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

-- Open marks on telescope
keymap("n", "<leader>m", "<cmd>Telescope buffers<cr>", opts)


-- Open neoclip on telescope
keymap("n", "<leader>c", "<cmd>Telescope neoclip<cr>", opts)

--keymap("n", "<leader>ts", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)
-- Personal keymaps
-- Save with ctrl-s 
--keymap("n",)
