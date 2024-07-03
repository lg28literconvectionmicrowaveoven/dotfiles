vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1-blinkon750
    augroup END
    set number
]])
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
    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd([[
                colorscheme nord
            ]])
    	end
    },
    { "rstacruz/vim-closer" },
    {
        "https://git.sr.ht/~swaits/zellij-nav.nvim",
        lazy = true,
        event = "VeryLazy",
        keys = {
            { "<c-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
            { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
            { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
            { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
        },
        opts = {},
    },
    { "imsnif/kdl.vim" },
    { "numToStr/comment.nvim" }
});
vim.g.mapleader=" "
vim.g.maplocalleader="\\"

