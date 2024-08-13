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
				"rustfmt",
				"taplo",
				"pylint",
				"eslint_d",
				"checkmake",
				"cmakelint",
				"cpplint",
				-- "clangtidy",
				"htmlhint",
				"jsonlint",
				"ktlint",
				"luacheck",
				"shellcheck",
			},
		})
	end,
}
