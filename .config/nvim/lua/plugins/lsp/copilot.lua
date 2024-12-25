return {
	"zbirenbaum/copilot-cmp",
	event = { "InsertEnter" },
	dependencies = {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		module = "copilot",
		opts = {
			suggestion = {
				enabled = false,
			},
			panel = {
				enabled = false,
			},
		},
	},
	module = "copilot_cmp",
	config = true,
}
