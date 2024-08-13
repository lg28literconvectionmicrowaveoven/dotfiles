local opt = vim.opt

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Tabspace adjustments
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4

-- Sets NetRW display style to tree
vim.cmd("let g:netrw_liststyle = 3")

-- Shows relative line numbers and current line number on margin
opt.relativenumber = true
opt.number = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true -- Case-sensitive when mixed case search

-- Terminal settings
opt.termguicolors = true
opt.background = "dark"
-- opt.signcolumn = "yes"

-- Use system clipboard
opt.clipboard:append("unnamedplus")

-- Window splits
opt.splitright = true
opt.splitbelow = true

-- Allow backspace on indent, end of line, start of line
opt.backspace = "indent,eol,start"
