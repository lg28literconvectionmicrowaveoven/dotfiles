return {
	"rshkarin/mason-nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"mfusenegger/nvim-lint",
	},
	config = function()
		require("mason-nvim-lint").setup({
			ensure_installed = {
				"gofumpt",
				"asmfmt",
				"clang-format",
				"google-java-format",
				"csharpier",
				"xmlformatter",
				"isort",
				"black",
				"beautysh",
				"stylua",
				"ktfmt",
				"taplo",
				"ruff",
				"eslint_d",
				"checkmake",
				"cmakelint",
				"cpplint",
				"cspell",
				"htmlhint",
				"jsonlint",
				"ktlint",
				"luacheck",
				"shellcheck",
			},
		})
	end,
}
