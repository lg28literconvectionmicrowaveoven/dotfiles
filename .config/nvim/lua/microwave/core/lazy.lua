local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ import = "microwave.plugins.lsp" },
	{ import = "microwave.plugins.git" },
	{ import = "microwave.plugins.utilities" },
	{ import = "microwave.plugins.theming" },
}, {
	checker = {
		enabled = true,
		notify = true,
	},
	change_detection = {
		notify = false,
	},
})
vim.cmd([[
    hi BufferLineFill guibg=#2E3440
    TSUpdateSync
    MasonUpdateAll
    hi WinSeparator guifg=#8fbcbb
]])
