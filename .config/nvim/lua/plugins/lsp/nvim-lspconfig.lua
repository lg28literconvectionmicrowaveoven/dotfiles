return {
	"neovim/nvim-lspconfig",
	event = "VimEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- import lspconfig plugin
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				local opts = { buffer = ev.buf, silent = true }
				local map = vim.keymap.set
				opts.desc = "Show LSP references"
				map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				opts.desc = "Go to declaration"
				map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				opts.desc = "Show LSP definitions"
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				opts.desc = "Show LSP implementations"
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				opts.desc = "Show LSP type definitions"
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				opts.desc = "See available code actions"
				map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				opts.desc = "Smart rename"
				map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
				opts.desc = "Show buffer diagnostics"
				map("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				opts.desc = "Go to previous diagnostic"
				map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				opts.desc = "Go to next diagnostic"
				map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				opts.desc = "Show documentation for what is under cursor"
				map("n", "F", vim.lsp.buf.hover, opts)
				opts.desc = "Restart LSP"
				map("n", "<leader>rs", "<cmd>LspRestart<cr>", opts) -- mapping to restart lsp if necessary
			end,
		})
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
				"jsonls",
			},
		})
		local lspconfig = require("lspconfig")
		local function navic_init(client, bufnr)
			-- Wait till LSP has processed the buffer before attaching nvim-navic
			local progress_count = 0
			vim.lsp.handlers["$/progress"] = function(_, result)
				if result.value and result.value.kind then
					if result.value.kind == "begin" then
						progress_count = progress_count + 1
					elseif result.value.kind == "end" then
						progress_count = progress_count - 1
						if progress_count == 0 then
							require("nvim-navic").attach(client, bufnr)
						end
					end
				else
					require("nvim-navic").attach(client, bufnr)
				end
			end
		end
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
					on_attach = navic_init,
				})
			end,
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
						navic_init(client, bufnr)
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
					on_attach = navic_init,
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
					on_attach = navic_init,
				})
			end,
			["bashls"] = function()
				-- Set bashls to work on all shell files
				lspconfig["bashls"].setup({
					capabilities = capabilities,
					filetypes = { "sh", "bash", "zsh" },
					on_attach = navic_init,
				})
			end,
			["gopls"] = function()
				-- Set bashls to work on all shell files
				lspconfig["gopls"].setup({
					capabilities = capabilities,
					filetypes = { "go" },
					on_attach = navic_init,
				})
			end,
			["jsonls"] = function()
				lspconfig["jsonls"].setup({
					capabilities = capabilities,
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = {
								enable = true,
							},
						},
					},
					on_attach = navic_init,
				})
			end,
			["yamlls"] = function()
				lspconfig["yamlls"].setup({
					capabilities = capabilities,
					schemaStore = {
						enable = false,
						url = "",
					},
					settings = {
						yaml = {
							schemas = require("schemastore").yaml.schemas(),
						},
					},
					on_attach = navic_init,
				})
			end,
			-- Do not set up jdtls and rust_analyzer with native LSP
			["jdtls"] = function() end,
			["rust_analyzer"] = function() end,
		})
	end,
}
