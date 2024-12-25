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
						["<C-t>"] = require("trouble.sources.telescope").open,
					},
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
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true } },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true } },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true } },
		{ "<leader>fn", "<cmd>Telescope notify<cr>", { noremap = true, silent = true } },
	},
}
