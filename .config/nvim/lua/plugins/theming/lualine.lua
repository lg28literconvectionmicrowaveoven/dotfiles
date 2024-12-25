return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
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
				lualine_c = {
					{ "diagnostics" },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ebcb8b" },
					},
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
