return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			fps = 60,
			timeout = 750,
			render = "wrapped-compact",
			icons = {
				DEBUG = " ",
				ERROR = " ",
				INFO = " ",
				TRACE = " 󰠠",
				WARN = " ",
			},
			max_width = 100,
			max_height = 2,
			top_down = false,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { focusable = false })
			end,
		})
	end,
}
