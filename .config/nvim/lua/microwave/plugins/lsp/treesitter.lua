return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				config = true,
				branch = "main",
			},
		},
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				tree_setter = {
					enable = true,
				},
				ensure_installed = {
					"c",
					"c_sharp",
					"cmake",
					"cpp",
					"css",
					"csv",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"html",
					"java",
					"javascript",
					"json",
					"kdl",
					"kconfig",
					"lua",
					"make",
					"kotlin",
					"ruby",
					"nix",
					"dockerfile",
					"powershell",
					"python",
					"r",
					"rust",
					"scss",
					"sql",
					"ssh_config",
					"toml",
					"typescript",
					"vim",
					"yaml",
					"svelte",
					"bash",
					"asm",
					"objdump",
					"editorconfig",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	-- {
	-- 	"filNaj/tree-setter",
	-- },
}
