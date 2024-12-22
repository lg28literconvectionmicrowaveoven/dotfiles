-- Language specific plugins
return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		"Mgenuit/nvim-dap-kotlin",
		config = true,
		ft = "kt",
	},
	{
		"leoluz/nvim-dap-go",
		config = true,
		ft = "go",
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("uv")
		end,
		ft = "py",
		keys = {
			{
				"<leader>dc",
				function()
					require("dap-python").test_class()
				end,
			},
			{
				"<leader>dm",
				function()
					require("dap-python").test_method()
				end,
			},
		},
	},
	{
		-- TODO: fix DAP not working
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
				dap = {
					adapter = require("rustaceanvim.config").get_codelldb_adapter(
						vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb"),
						vim.fn.expand("~/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.so")
					),
				},
			}
		end,
	},
}
