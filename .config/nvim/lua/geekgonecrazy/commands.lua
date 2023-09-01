vim.api.nvim_command([[ autocmd BufWritePre * :%s/\s\+$//e ]])
