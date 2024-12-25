return {
	"0x00-ketsu/maximizer.nvim",
	module = "maximizer",
	opts = {},
	keys = {
		{
			"<leader>sm",
			"<cmd>lua require('maximizer').toggle()<cr>",
			desc = "Maximize/Restore currently focused split",
		},
	},
}
