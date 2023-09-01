local lsp = require("lsp-zero").preset()

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	local getOpts = function(desc)
		return {
			buffer = bufnr,
			remap = false,
			desc = desc,
		}
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, getOpts("Go to definition"))
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, getOpts("Go to type definition"))
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, getOpts("Previous diagnostic"))
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, getOpts("Next diagnostic"))
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, getOpts("Code Actions"))
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, getOpts("Rename symbol"))
	vim.keymap.set({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, getOpts("Run LSP formatter"))
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, getOpts("Signature Help"))
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- Make sure to configure cmp AFTER lsp-zero
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	},
	preselect = cmp.PreselectMode.Item,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.diagnostic.config({
	virtual_text = true,
})
