return {
	"jay-babu/mason-nvim-dap.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"python",
				"delve",
				"cpptools",
				"firefox",
				"js",
				"bash",
				"javatest",
				"kotlin",
				"dart",
			},
			handlers = {},
		})
	end,
}
