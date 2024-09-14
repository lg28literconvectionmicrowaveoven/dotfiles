return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local map = vim.keymap.set
		require("aerial").setup({
			on_attach = function(bufnr)
				map("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
				map("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
			end,
		})
		map("n", "<leader>a", "<cmd>AerialToggle!<cr>")
	end,
}
