return {
	"booperlv/nvim-gomove",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gomove").setup({
			-- whether or not to vim.keymap.set default key bindings, (true/false)
			map_defaults = false,
			-- whether or not to reindent lines moved vertically (true/false)
			reindent = true,
			-- whether or not to undojoin same direction moves (true/false)
			undojoin = true,
			-- whether to not to move past end column when moving blocks horizontally, (true/false)
			move_past_end_col = false,
		})
		local map = vim.keymap.set
		map("n", "<S-h>", "<Plug>GoNMLineLeft", {})
		map("n", "<S-l>", "<Plug>GoNMLineRight", {})
		map("n", "<C-j>", "<Plug>GoNDLineDown", {})
		map("n", "<C-k>", "<Plug>GoNDLineUp", {})
		map("x", "<S-h>", "<Plug>GoVMLineLeft", {})
		map("x", "<S-l>", "<Plug>GoVMLineRight", {})
		map("x", "<C-j>", "<Plug>GoVDLineDown", {})
		map("x", "<C-k>", "<Plug>GoVDLineUp", {})
	end,
}
