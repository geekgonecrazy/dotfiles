--
-- Tip: only use double leader (e.g. <leader><leader>) for maps you won't be using often
--

vim.g.mapleader = ' '

-- Open Netrw
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = 'Open Netrw' })

-- Easy window handling (pressing ctrl is too much wrist displacement)
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Window handling' })
vim.keymap.set('n', '<A-w>', '<C-w>', { desc = 'Window handling' })

-- Pressing ESC is too much wrist displacement
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Easy escape (pressing ESC is too much wrist displacement)' })
vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Easy escape (pressing ESC is too much wrist displacement)' })

-- Better horizontal navigation on insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Better horizontal navigation on insert mode' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Better horizontal navigation on insert mode' })

-- Quick saving, faster than typing the commands
vim.keymap.set('n', '<leader>ss', vim.cmd.write, { remap = false, desc = 'Save' })
vim.keymap.set('n', '<leader>sa', function () vim.cmd('wa') end, { remap = false, desc = 'Save all' })
vim.keymap.set('n', '<leader>sq', function () vim.cmd('wq') end, { remap = false, desc = 'Save and quit' })

-- Toggle relative number if sharing screen so others don't get confusion
vim.keymap.set('n', '<leader><leader>n', function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = 'Toggle relative number' })

-- Easy copy/paste to clipboard
vim.keymap.set({'n', 'v'}, '<A-y>', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set({'n', 'v'}, '<A-p>', '"+p', { desc = 'Paste from clipboard' })

-- Move highlighted lines on visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down on visual mode' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines up on visual mode' })

-- Move to search result and centralize viewport
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Page scroll and centralize
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Page scroll and centralize' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Page scroll and centralize' })
vim.keymap.set("n", "<A-d>", "<C-d>zz", { desc = 'Page scroll and centralize' })
vim.keymap.set("n", "<A-u>", "<C-u>zz", { desc = 'Page scroll and centralize' })

-- Alt is closer than CTRL (less wrist displacement)
vim.keymap.set("", "<A-p>", "<C-p>")
vim.keymap.set("", "<A-n>", "<C-n>")
vim.keymap.set("", "<A-m>", "<C-m>")
vim.keymap.set("i", "<A-c>", "<ESC>")
vim.keymap.set("i", "<A-w>", "<C-w>")
vim.keymap.set("i", "<A-u>", "<C-u>")

-- Join lines without moving cursor (as the default would do)
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Join lines without moving cursor' })

-- Paste over (replace) visual highlight without overwriting default register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste over (replace) visual highlight without overwriting default register' })

-- Easy close all
vim.keymap.set('n', '<leader>qa', function() vim.cmd('qa') end, { desc = 'Close all' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bp', function() vim.cmd('bp') end, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', function() vim.cmd('bn') end, { desc = 'Next buffer' })

-- Terminal emulator
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = 'Terminal: Quick escape' })
vim.keymap.set("t", "kj", "<C-\\><C-n>", { desc = 'Terminal: Quick escape' })
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = 'Terminal: Escape' })

-- Disable eslint diagnostics
function DisableEslintDiagnostics()
	for id, namespace in pairs(vim.diagnostic.get_namespaces()) do
		-- for some reason this is the name of the `eslint` namespace
		if namespace.name == 'NULL_LS_SOURCE_3' then
			vim.diagnostic.disable(nil, id)
		end
	end
end
