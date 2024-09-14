return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			diagnostics = "nvim_lsp",
			show_buffer_close_icons = false,
			show_close_icon = false,
			offsets = {
				{
					filetype = "NvimTree",
					text = function()
						return vim.fn.getcwd()
					end,
					text_align = "center",
					highlight = "Directory",
					separator = " ",
				},
			},
			custom_areas = {
				right = function()
					local result = {}
					local severity = vim.diagnostic.severity
					local error = #vim.diagnostic.get(0, { severity = severity.ERROR })
					local warning = #vim.diagnostic.get(0, { severity = severity.WARN })
					local info = #vim.diagnostic.get(0, { severity = severity.INFO })
					local hint = #vim.diagnostic.get(0, { severity = severity.HINT })
					-- TODO: colors of gutter icons are adding in the opposite direction
					if error ~= 0 then
						table.insert(result, { text = "  " .. error, fg = "#EC5241", bg = "#2e3440" })
					end
					if warning ~= 0 then
						table.insert(result, { text = "  " .. warning, fg = "#EFB839", bg = "#2e3440" })
					end
					if hint ~= 0 then
						table.insert(result, { text = " 󰌵 " .. hint, fg = "#A3BA5E", bg = "#2e3440" })
					end
					if info ~= 0 then
						table.insert(result, { text = "  " .. info, fg = "#7EA9A7", bg = "#2e3440" })
					end
					return result
				end,
			},
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	},
}
