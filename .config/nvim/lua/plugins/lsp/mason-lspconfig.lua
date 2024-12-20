return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"csharp_ls",
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
				"gopls",
			},
		})
	end,
}
