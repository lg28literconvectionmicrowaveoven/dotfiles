return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "ivy",
				},
				oldfiles = {
					theme = "ivy",
				},
				live_grep = {
					theme = "ivy",
				},
				buffers = {
					theme = "ivy",
				},
				help_tags = {
					theme = "ivy",
				},
				notify = {
					theme = "ivy",
				},
				lsp_references = {
					theme = "cursor",
				},
				lsp_definitions = {
					theme = "cursor",
				},
				lsp_implementations = {
					theme = "cursor",
				},
				lsp_type_definitions = {
					theme = "cursor",
				},
				diagnostics = {
					theme = "cursor",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("frecency")
		telescope.load_extension("ui-select")
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true } },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true } },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true } },
		{ "<leader>ft", "<cmd>TodoTelescope theme=ivy<cr>", { noremap = true, silent = true } },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true } },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true } },
		{ "<leader>fn", "<cmd>Telescope notify<cr>", { noremap = true, silent = true } },
	},
}
