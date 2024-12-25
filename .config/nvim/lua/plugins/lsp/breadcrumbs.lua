return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"numToStr/Comment.nvim",
		"nvim-telescope/telescope.nvim",
		{
			"SmiteshP/nvim-navic",
			config = function()
				local navic = require("nvim-navic")
				navic.setup({
					highlight = true,
					separator = "  ",
					depth_limit = 3,
				})
			end,
		},
	},
	opts = {
		lsp = {
			auto_attach = true,
		},
		window = {
			border = "rounded",
			position = {
				row = "5%",
				col = "98%",
			},
		},
	},
	keys = {
		{
			"<leader>o",
			"<cmd>Navbuddy<cr>",
			{ desc = "Open breadcrumb navigator" },
		},
	},
}
