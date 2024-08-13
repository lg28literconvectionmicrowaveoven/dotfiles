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
	{ import = "microwave.plugins" },
	{ import = "microwave.plugins.lsp" },
	{ import = "microwave.plugins.git" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
vim.cmd([[
    hi BufferLineFill guibg=#2E3440
    TSUpdateSync
    MasonUpdateAll
    hi WinSeparator guifg=#1d212a
]])
if require("lazy.status").has_updates() then
	vim.cmd("Lazy update")
end
