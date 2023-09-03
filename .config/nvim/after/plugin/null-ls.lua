require("mason-null-ls").setup({
  ensure_installed = { "stylua", "prettierd", "eslint_d", "golangci-lint", "gopls", "lua-language-server" },
  automatic_installation = true,
})

local nls = require('null-ls')

nls.setup({
  sources = {
    nls.builtins.formatting.stylua,
    nls.builtins.formatting.prettierd,
    nls.builtins.diagnostics.eslint_d,
  }
})

