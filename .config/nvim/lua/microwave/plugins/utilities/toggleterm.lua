return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			float_opts = {

				border = "curved",
			},
		})
		local map = vim.keymap.set
		map(
			"n",
			"<leader>cd",
			"<cmd>ToggleTerm direction=horizontal<cr>",
			{ desc = "Open ToggleTerm Horizontal window" }
		)
		map("n", "<leader>cr", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Open ToggleTerm Vertical window" })
		map("n", "<leader>cf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open ToggleTerm floating window" })
		map("n", "<leader>cc", "<cmd>ToggleTermToggleAll<cr>", { desc = "Close all ToggleTerm windows" })
		map("n", "<leader>ct", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Open ToggleTerm tab" })
	end,
}
