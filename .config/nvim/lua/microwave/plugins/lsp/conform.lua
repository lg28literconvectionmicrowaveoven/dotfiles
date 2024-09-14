return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				asm = { "asmfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				csharp = { "csharpier" },
				java = { "google-java-format" },
				python = { "isort", "black" },
				bash = { "beautysh" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				kotlin = { "ktfmt" },
				rust = { "rust-analyzer" },
				toml = { "taplo" },
				xml = { "xmlformatter" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end)
	end,
}
