return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "ruff" },
			make = { "checkmake" },
			cmake = { "cmakelint" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			html = { "htmlhint" },
			json = { "jsonlint" },
			kotlin = { "ktlint" },
			lua = { "luacheck" },
			bash = { "shellcheck" },
			markdown = { "cspell" },
			text = { "cspell" },
		}
		-- Add vim to globals
		lint.linters.luacheck = {
			cmd = "luacheck",
			stdin = true,
			args = {
				"--globals",
				"vim",
				"lvim",
				"reload",
				"--",
			},
			stream = "stdout",
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "luacheck",
			}),
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
		require("mason-nvim-lint").setup({
			ensure_installed = {
				"gofumpt",
				"asmfmt",
				"clang-format",
				"csharpier",
				"xmlformatter",
				"isort",
				"black",
				"beautysh",
				"stylua",
				"ktfmt",
				"taplo",
				"ruff",
				"checkmake",
				"cmakelint",
				"cpplint",
				"cspell",
				"ktlint",
				"luacheck",
				"shellcheck",
				"prettier",
				"eslint_d",
				"htmlhint",
				"jsonlint",
				"cspell",
			},
		})
	end,
}
