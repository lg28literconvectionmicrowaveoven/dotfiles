return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
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
				"tsserver",
				"kotlin_language_server",
				"autotools_ls",
				"pyright",
				"sqlls",
				"svelte",
				"taplo",
				"lemminx",
				"yamlls",
				"emmet_ls",
				"lua_ls",
			},
		})
	end,
}
