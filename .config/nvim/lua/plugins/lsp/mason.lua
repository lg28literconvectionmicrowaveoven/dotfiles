return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"RubixDev/mason-update-all",
			opts = {},
		},
	},
	event = "VimEnter",
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
		require("mason-tool-installer").setup({
			ensure_installed = {
				"codelldb",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 1500,
		})
		vim.cmd("MasonUpdateAll")
	end,
}
