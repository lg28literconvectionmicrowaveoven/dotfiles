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
			{ "n", "<leader>dc", ":lu require('dap-python').test_class()<CR>" },
			{ "n", "<leader>dm", ":lua require('dap-python').test_method()<CR>" },
		},
	},
}
