return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.files").setup({
			mappings = {
				synchronize = "<cr>",
			},
			options = {
				use_as_default_explorer = false, -- Don't open mini.files when launching a directory
			},
			windows = {
				preview = true,
			},
		})
	end,
}
