return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lazy_status = require("lazy.status")
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
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ebcb8b" },
					},
				},
				lualine_x = {
					{ "encoding" },
					{ "diff" },
				},
				lualine_y = {
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
