local opt = vim.opt

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Tabspace adjustments
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4

-- Disable NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Set eob character to blank
vim.o.fillchars = "eob: "

-- Set cwd to opened directory (if directory)
if vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
	vim.cmd.cd(vim.fn.argv()[1])
end

-- Tracks and provides shortcuts to provide all untouched buffers
local id = vim.api.nvim_create_augroup("startup", {
	clear = false,
})
local persistbuffer = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	vim.fn.setbufvar(bufnr, "bufpersist", 1)
end
vim.api.nvim_create_autocmd({ "BufRead" }, {
	group = id,
	pattern = { "*" },
	callback = function()
		vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
			buffer = 0,
			once = true,
			callback = function()
				persistbuffer()
			end,
		})
	end,
})
vim.keymap.set("n", "<leader>b", function()
	local curbufnr = vim.api.nvim_get_current_buf()
	local buflist = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buflist) do
		if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
			vim.cmd("bd " .. tostring(bufnr))
		end
	end
end, { silent = true, desc = "Close unused buffers" })
