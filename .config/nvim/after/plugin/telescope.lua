local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local builtin = require('telescope.builtin')

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ld', builtin.lsp_document_symbols, { desc = 'Telescope: Document symbols' })
vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, { desc = 'Telescope: Workspace symbols' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })
vim.keymap.set('n', '<leader>fo', function ()
	-- Only show oldfiles from the current directory
	builtin.oldfiles({ cwd_only = true })
end, { desc = 'Telescope: Oldfiles' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope: Marks' })

-- List all available pickers
vim.keymap.set('n', '<leader>f,', builtin.builtin, { desc = 'Telescope: Built-in Pickers' })

-- Git management
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope: Git status' })

vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end, { desc = 'Telescope: Grep string' })

local is_inside_work_tree = {};

vim.keymap.set('n', '<leader>ff', function()
	local opts = {} -- define here if you want to define something

	local cwd = vim.fn.getcwd()
	if is_inside_work_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_work_tree[cwd] = vim.v.shell_error == 0
	end

	if is_inside_work_tree[cwd] then
		builtin.git_files(opts)
	else
		builtin.find_files(opts)
	end
end, { desc = 'Telescope: Smart find files' })
