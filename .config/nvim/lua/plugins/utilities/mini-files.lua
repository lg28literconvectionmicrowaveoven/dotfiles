return {
	"echasnovski/mini.files",
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
	keys = {
		{ "<leader>e", '<cmd>lua require("mini.files").open()<cr>', { desc = "Toggle mini.files floating window" } },
	},
}
