return {
	"0x00-ketsu/maximizer.nvim",
	module = "maximizer",
	opts = {},
	keys = {
		{
			"<A-m>",
			"<cmd>lua require('maximizer').toggle()<cr>",
			desc = "Maximize/Restore currently focused split",
		},
	},
}
