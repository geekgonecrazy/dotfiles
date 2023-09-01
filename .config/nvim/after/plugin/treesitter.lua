require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "lua", "javascript", "typescript", "tsx", "query" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		--disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--disable = function(lang, buf)
		--    local max_filesize = 100 * 1024 -- 100 KB
		--    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		--    if ok and stats and stats.size > max_filesize then
		--        return true
		--    end
		--end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	-- Treesitter Text objects baby!!
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<leader>t',
			node_incremental = '<A-k>',
			scope_incremental = '<A-K>',
			node_decremental = '<A-j>',
		},
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		-- Not sure I want this?
		-- swap = {
		-- 	enable = true,
		-- 	swap_next = {
		-- 		['<leader>a'] = '@parameter.inner',
		-- 	},
		-- 	swap_previous = {
		-- 		['<leader>A'] = '@parameter.inner',
		-- 	},
		-- },
	},
})

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, { desc = "Treesitter: Repeat last move forward" })
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, { desc = "Treesitter: Repeat last move backward" })

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f, { desc = "Treesitter: Repeat f movement" })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F, { desc = "Treesitter: Repeat F movement" })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t, { desc = "Treesitter: Repeat t movement" })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T, { desc = "Treesitter: Repeat T movement" })

require("treesitter-context").setup()

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true, desc = "Treesitter: Go to context above" })
