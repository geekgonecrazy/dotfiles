-- Aesthetic
local catppuccin = require("catppuccin")
catppuccin.setup {}
vim.cmd[[colorscheme catppuccin]]

require'nvim-treesitter.configs'.setup { ensure_installed = { 'python', 'javascript', 'lua', 'rust', 'c', 'go', 'typescript' }, highlight = { enable = true } }

-- Native LSP Setup
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local map = vim.api.nvim_set_keymap

local on_attach = function(client, bufnr)

  -- Mappings
  local opts = { noremap=true, silent=true }

  map("n", "K", '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map("n", "gd", '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map("n", "gt", '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map("n", "gi", '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map("n", "<leader>dj", '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map("n", "<leader>dk", '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
  map("n", "<leader>r", '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map("n", "<leader>ca", '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- End Mappings
end

lspconfig.gopls.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- lualine
require('lualine').setup{
  options = {
    theme = 'catppuccin'
  }
}

-- LSP autocomplete
vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim values

  -- Setup nvim-cmp.
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime (Plugin) exists somewhere as lua/telescope/actions/state.lua
require('telescope').setup{
  defaults = {
      prompt_prefix = "$ ",
      mappings = {
          i = {
            ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end 
          }        
      }
  }
}
--require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local mappings = {
    
}

mappings.curr_buf = function() 
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
