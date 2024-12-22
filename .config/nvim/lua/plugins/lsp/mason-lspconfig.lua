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
				"rust_analyzer",
				"jdtls",
			},
		})
		local lspconfig = require("lspconfig")
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		require("mason-lspconfig").setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["bashls"] = function()
				-- Set bashls to work on all shell files
				lspconfig["bashls"].setup({
					capabilities = capabilities,
					filetypes = { "sh", "bash", "zsh" },
				})
			end,
			["gopls"] = function()
				-- Set bashls to work on all shell files
				lspconfig["gopls"].setup({
					capabilities = capabilities,
					filetypes = { "go" },
				})
			end,
			-- Do not set up jdtls and rust_analyzer with native LSP
			["jdtls"] = function() end,
			["rust_analyzer"] = function() end,
		})
	end,
}
