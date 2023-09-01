local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.clipboard = ''

-- This is for configuring the split behavior
opt.splitbelow = true
opt.splitright = true

opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")
opt.listchars:append("tab:▸ ")

vim.g.netrw_liststyle = 3

-- opt.colorcolumn = "80"
