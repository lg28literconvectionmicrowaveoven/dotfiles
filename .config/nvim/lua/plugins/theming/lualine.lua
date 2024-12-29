return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local lazy_status = require("lazy.status")
		require("lualine").setup({
			options = {
				theme = {
					inactive = {
						a = {
							bg = "#2e3440",
							fg = "#3B4252",
							gui = "bold",
						},
						b = {
							bg = "#3B4252",
							fg = "#E5E9F0",
						},
						c = {
							bg = "None",
							fg = "#E5E9F0",
						},
					},
					insert = {
						a = {
							bg = "#ECEFF4",
							fg = "#3B4252",
							gui = "bold",
						},
					},
					normal = {
						a = {
							bg = "#81a1c1",
							fg = "#3B4252",
							gui = "bold",
						},
						b = {
							bg = "#3B4252",
							fg = "#E5E9F0",
						},
						c = {
							bg = "None",
							fg = "#E5E9F0",
						},
					},
					replace = {
						a = {
							bg = "#EBCB8B",
							fg = "#3B4252",
							gui = "bold",
						},
					},
					visual = {
						a = {
							bg = "#8FBCBB",
							fg = "#3B4252",
							gui = "bold",
						},
					},
				},
				icons_enabled = true,
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			extensions = { "nvim-tree" },
			sections = {
				lualine_b = {
					{
						function()
							local navic = require("nvim-navic")
							if navic.is_available() then
								local navic_location = navic.get_location()
								if navic_location == "" then
									return ""
								else
									return navic_location .. "%#NavicEnd#"
								end
							else
								return ""
							end
						end,
						-- require("nvim-navic").get_location,
						-- cond = require("nvim-navic").is_available,
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ebcb8b" },
					},
					{ "diff" },
				},
				lualine_y = {
					{
						"branch",
						color = {
							fg = "#81a1c1",
						},
					},
				},
				lualine_z = {
					{
						"diagnostics",
						color = {
							bg = "#4c566a",
						},
					},
				},
			},
		})
	end,
}
