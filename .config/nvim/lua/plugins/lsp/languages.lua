-- Language specific plugins
return {
	"b0o/schemastore.nvim",
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		"Mgenuit/nvim-dap-kotlin",
		ft = "kotlin",
		opts = {},
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		opts = {},
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("uv")
		end,
		ft = "python",
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
		"mrcjkb/rustaceanvim",
		version = "^5",
		ft = "rust",
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
					on_attach = function(client, bufnr)
						-- Wait till LSP has processed the buffer before attaching nvim-navic
						local progress_count = 0
						vim.lsp.handlers["$/progress"] = function(_, result)
							if result.value and result.value.kind then
								if result.value.kind == "begin" then
									progress_count = progress_count + 1
								elseif result.value.kind == "end" then
									progress_count = progress_count - 1
									if progress_count == 0 then
										require("nvim-navic").attach(client, bufnr)
									end
								end
							end
						end
					end,
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
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{
					path = "${3rd}/luv/library",
					words = { "vim%.uv" },
				},
			},
		},
	},
	-- {
	-- 	"ziglang/zig.vim",
	-- 	ft = "zig",
	-- },
}
