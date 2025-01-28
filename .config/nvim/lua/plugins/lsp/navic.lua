return {
	"SmiteshP/nvim-navic",
	config = function()
		local navic = require("nvim-navic")
		navic.setup({
			highlight = true,
			-- separator = "  ",
			separator = " | ",
			depth_limit = 3,
		})
	end,
}
