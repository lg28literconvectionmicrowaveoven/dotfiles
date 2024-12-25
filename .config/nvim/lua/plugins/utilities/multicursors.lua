return {
	"smoka7/multicursors.nvim",
	dependencies = "nvimtools/hydra.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	opts = {},
	keys = {
		{
			mode = { "v", "n" },
			"<leader>m",
			"<cmd>MCstart<cr>",
			desc = "Create a selection for selected text or word under the cursor",
		},
	},
}
