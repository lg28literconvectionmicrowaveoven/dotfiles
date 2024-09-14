return {
	"booperlv/nvim-gomove",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gomove").setup({
			-- whether or not to vim.keymap.set default key bindings, (true/false)
			map_defaults = false,
			-- whether or not to reindent lines moved vertically (true/false)
			reindent = false,
			-- whether or not to undojoin same direction moves (true/false)
			undojoin = true,
			-- whether to not to move past end column when moving blocks horizontally, (true/false)
			move_past_end_col = false,
		})
		local map = vim.keymap.set
		map("n", "<S-h>", "<Plug>GoNMLineLeft", {})
		map("n", "<S-j>", "<Plug>GoNMLineDown", {})
		map("n", "<S-j>", "<Plug>GoNMLineDown", {})
		map("n", "<S-j>", "<Plug>GoNMLineDown", {})
		map("n", "<S-k>", "<Plug>GoNMLineUp", {})
		map("n", "<S-l>", "<Plug>GoNMLineRight", {})
		map("n", "<C-h>", "<Plug>GoNDLineLeft", {})
		map("n", "<C-j>", "<Plug>GoNDLineDown", {})
		map("n", "<C-k>", "<Plug>GoNDLineUp", {})
		map("n", "<C-l>", "<Plug>GoNDBlockRight", {})
		map("x", "<S-h>", "<Plug>GoVMLineLeft", {})
		map("x", "<S-j>", "<Plug>GoVMLineDown", {})
		map("x", "<S-k>", "<Plug>GoVMLineUp", {})
		map("x", "<S-l>", "<Plug>GoVMLineRight", {})
		map("x", "<C-h>", "<Plug>GoVDLineLeft", {})
		map("x", "<C-j>", "<Plug>GoVDLineDown", {})
		map("x", "<C-k>", "<Plug>GoVDLineUp", {})
		map("x", "<C-l>", "<Plug>GoVDLineRight", {})
	end,
}
