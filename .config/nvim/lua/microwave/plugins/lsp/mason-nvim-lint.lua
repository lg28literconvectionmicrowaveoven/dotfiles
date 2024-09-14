return {
	"rshkarin/mason-nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
		"mfusenegger/nvim-lint",
	},
	config = function()
		require("mason-nvim-lint").setup({
			ensure_installed = {
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
				"rust-analyzer",
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
