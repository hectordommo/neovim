local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
 keymap("", "<Space>", "<Nop>", opts)
 vim.g.mapleader = " "
 vim.g.maplocalleader = " "

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

-- Past the first registry
keymap("n", "<c-p>", "\"0p", opts)
keymap("x", "<C-p>", "\"0p", opts)
keymap("v", "<leader>p", "\"_dP", opts)


-- Regular save
keymap('n', '<c-s>', ':w!<CR>', {})	  -- ctrl-save <- :w    : NORMAL
keymap('i', '<c-s>', '<ESC>:w<CR>', {})  -- ctrl-save < ESC :w : INSERT

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

-- move selected lines up and Down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- keep search next and prev at page center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope git_files<cr>", opts)
-- Open buffers on telescope
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- Open live grep on telescope
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)

-- Open project files on telescope
keymap("n", "<leader>pf", "<cmd>Telescope find_files<cr>", opts)

-- Open marks on telescope
keymap("n", "<leader>m", "<cmd>Telescope marks<cr>", opts)

-- Open neoclip on telescope
keymap("n", "<leader>cp", "<cmd>Telescope neoclip<cr>", opts)

--keymap("n", "<leader>ts", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>nj", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)

vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })


-- Glance
vim.keymap.set('n', '<Leader>gd', '<cmd>Glance definitions<CR>')
vim.keymap.set('n', '<Leader>gr', '<cmd>Glance references<CR>')

-- PHP auto namespace 
vim.keymap.set("n", "<leader>la", "<cmd>GetAllClasses<cr>")
vim.keymap.set("n", "<leader>lc", "<cmd>GetClass<cr>")
vim.keymap.set("n", "<leader>ls", "<cmd>SortClass<cr>")

-- Bind the function to a key mapping (you can change this to your preference)
vim.keymap.set('n', '<leader>ts', ':lua ToggleTabSize()<CR>', { noremap = true, silent = true })

-- Bind the function to a key mapping (you can change this to your preference)
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua ListAndExecuteCommands()<CR>', { noremap = true, silent = true })
