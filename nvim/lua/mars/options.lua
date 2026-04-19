-- Options
-- Core Neovim settings

-- Leader keys (must be set before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modeline
vim.opt.modeline = true
vim.opt.modelines = 1

-- Nerd Font support
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse and mode display
vim.o.mouse = 'a'
vim.o.showmode = false

-- Clipboard (scheduled to avoid startup delay)
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation
vim.o.breakindent = true
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Persistence
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- UI
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Folding (Treesitter)
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
