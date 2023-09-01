require("indent_blankline").setup {
	space_char_blankline = " ",
	use_treesitter = true,
	show_current_context = true,
	show_current_context_start = true,
}

-- For some reason the default colors were weird
vim.cmd [[highlight IndentBlanklineSpaceCharBlankline guifg=#3B4261 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#3B4261 gui=nocombine]]
