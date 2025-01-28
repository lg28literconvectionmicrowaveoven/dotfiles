-- TODO: fix prettierd
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
				python = { "isort", "black" },
				bash = { "beautysh" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				liquid = { "prettierd" },
				lua = { "stylua" },
				kotlin = { "ktfmt" },
				toml = { "taplo" },
				xml = { "xmlformatter" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				prettierd = {
					prepend_args = {
						"--tab-width",
						"4",
					},
				},
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>ss", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end)
		local notify = require("notify")
		conform.setup({
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
		})
		local function show_notification(message, level)
			notify(message, level, { title = "conform.nvim" })
		end
		vim.keymap.set({ "n", "v" }, "<leader>s", function(args)
			if is_global then
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				if vim.g.disable_autoformat then
					show_notification("Autoformat-on-save disabled globally", "info")
				else
					show_notification("Autoformat-on-save enabled globally", "info")
				end
			else
				vim.b.disable_autoformat = not vim.b.disable_autoformat
				if vim.b.disable_autoformat then
					show_notification("Autoformat-on-save disabled for this buffer", "info")
				else
					show_notification("Autoformat-on-save enabled for this buffer", "info")
				end
			end
		end, { desc = "Toggle autoformat-on-save" })
	end,
}
