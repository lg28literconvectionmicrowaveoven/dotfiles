return {
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		branch = "main",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = {
			"html",
			"javascript",
			"typescript",
			"svelte",
			"vue",
			"css",
			"scss",
			"json",
			"yaml",
			"markdown",
		},
	},
	{
		"filNaj/tree-setter",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "InsertEnter" },
	},
}
