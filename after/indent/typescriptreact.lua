-- Neovim's bundled indent/typescript.vim doesn't understand JSX, so `=`
-- mangles indentation in .tsx files. Use treesitter's indent queries instead.
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
