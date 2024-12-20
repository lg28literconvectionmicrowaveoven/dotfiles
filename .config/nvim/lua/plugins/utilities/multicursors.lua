return {
	"smoka7/multicursors.nvim",
	event = "VeryLazy",
	dependencies = "nvimtools/hydra.nvim",
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	config = true,
	keys = {
		{
			mode = { "v", "n" },
			"<Leader>m",
			"<cmd>MCstart<cr>",
			desc = "Create a selection for selected text or word under the cursor",
		},
	},
}
