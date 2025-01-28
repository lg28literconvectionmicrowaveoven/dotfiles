return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"numToStr/Comment.nvim",
		"nvim-telescope/telescope.nvim",
		"SmiteshP/nvim-navic",
	},
	opts = {
		lsp = {
			auto_attach = true,
		},
		window = {
			border = "rounded",
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
