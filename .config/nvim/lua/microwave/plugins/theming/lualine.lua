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
				icons_enabled = true,
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			extensions = { "nvim-tree" },
			sections = {
				lualine_b = {
					{ "diagnostics" },
				},
				lualine_c = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ebcb8b" },
					},
				},
				lualine_x = {
					{ "diff" },
				},
				lualine_y = {
					{ "branch" },
				},
				lualine_z = {
					{ "progress" },
				},
			},
		})
	end,
}
