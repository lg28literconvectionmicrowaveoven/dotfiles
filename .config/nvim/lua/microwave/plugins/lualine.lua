return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = require("lualine.themes.nord"),
				globalstatus = true,
			},
			extensions = { "nvim-tree" },
			sections = {
				lualine_b = {
					{ "filetype" },
				},
				lualine_c = {
					{ "fileformat" },
				},
				lualine_x = {
					{ "encoding" },
					{ "diff" },
				},
				lualine_y = {
					{ "diff" },
					{ "branch" },
					{ "progress" },
				},
				lualine_z = {
					{ "location" },
				},
			},
		})
	end,
}
