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
    { "rstacruz/vim-closer" },
    { "imsnif/kdl.vim" },
    { "numToStr/comment.nvim" },
    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd('colorscheme nord')
        end
    },
    {
        "booperlv/nvim-gomove",
        config = function()
          	require("gomove").setup {
                -- whether or not to map default key bindings, (true/false)
                map_defaults = false,
                -- whether or not to reindent lines moved vertically (true/false)
                reindent = true,
                -- whether or not to undojoin same direction moves (true/false)
                undojoin = true,
                -- whether to not to move past end column when moving blocks horizontally, (true/false)
                move_past_end_col = false,
            }
        end
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("render-markdown").setup({})
        end,
    }
--[[{ "xiyaowong/transparent.nvim" },
    {
        "https://git.sr.ht/~swaits/zellij-nav.nvim",
        lazy = true,
        event = "VeryLazy",
        keys = {
            { '<c-h>', "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
            { '<c-j>', "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
            { '<c-k>', "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
            { '<c-l>', "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
        },
        opts = {},
    }]]--
});
