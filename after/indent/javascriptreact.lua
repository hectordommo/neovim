-- Neovim's bundled indent/javascript.vim doesn't understand JSX, so `=`
-- mangles indentation in .jsx files. Use treesitter's indent queries instead.
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
