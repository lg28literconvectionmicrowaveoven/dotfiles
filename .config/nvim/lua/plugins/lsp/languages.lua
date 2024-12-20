return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		"Mgenuit/nvim-dap-kotlin",
		config = true,
	},
	{
		"leoluz/nvim-dap-go",
		config = true,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("uv")
		end,
		keys = {
			{
				"n",
				"<leader>dc",
				function()
					require("dap-python").test_class()
				end,
			},
			{
				"n",
				"<leader>dm",
				function()
					require("dap-python").test_method()
				end,
			},
		},
	},
}
