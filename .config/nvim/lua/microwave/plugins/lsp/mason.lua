return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"RubixDev/mason-update-all",
				config = true,
			},
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_pending = "⚠",
						package_installed = "✓",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"asm_lsp",
					"bashls",
					"clangd",
					"cmake",
					"cssls",
					"dockerls",
					"html",
					"htmx",
					"jdtls",
					"kotlin_language_server",
					"autotools_ls",
					"sqlls",
					"svelte",
					"taplo",
					"lemminx",
					"yamlls",
					"emmet_ls",
					"lua_ls",
					"pyright",
					"tailwindcss",
					"ts_ls",
				},
			})
		end,
	},
}
