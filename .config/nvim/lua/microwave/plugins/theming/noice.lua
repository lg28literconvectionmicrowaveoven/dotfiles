return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- {
		-- 	"rcarriga/nvim-notify",
		-- 	opts = {
		-- 		fps = 165,
		-- 		timeout = 2000,
		-- 		render = "compact",
		-- 		icons = {
		-- 			DEBUG = " ",
		-- 			ERROR = " ",
		-- 			INFO = " ",
		-- 			TRACE = " 󰠠",
		-- 			WARN = " ",
		-- 		},
		-- 	},
		-- 	config = function()
		-- 		require("notify").setup({
		-- 			on_open = function(win)
		-- 				vim.api.nvim_win_set_config(win, { focusable = false })
		-- 			end,
		-- 		})
		-- 	end,
		-- },
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		})
	end,
}
