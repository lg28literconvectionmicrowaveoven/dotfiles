-- TODO: wider vertical split terminal window
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			float_opts = {
				border = "curved",
			},
			shade_terminals = false,
		})
		local map = vim.keymap.set
		map("n", "<A-w>d", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Open ToggleTerm Horizontal window" })
		map(
			"n",
			"<A-w>r",
			"<cmd>ToggleTerm direction=vertical size=40<cr>",
			{ desc = "Open ToggleTerm Vertical window" }
		)
		map("n", "<A-w>f", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open ToggleTerm floating window" })
		map("n", "<A-w>t", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Open ToggleTerm tab" })
	end,
}
