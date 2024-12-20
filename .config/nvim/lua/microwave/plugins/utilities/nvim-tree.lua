-- TODO: switch to oil.nvim
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			view = {
				width = 40,
				signcolumn = "no",
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
				special_files = {
					"Makefile",
					"CMakeLists.txt",
					"Magefile",
					"go.mod",
					"go.sum",
					"pyproject.toml",
					".gitignore",
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
}
