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
		local ufo = require("ufo")
		map("n", "<leader>zR", ufo.openAllFolds, { desc = "Opens all code folds" })
		map("n", "<leader>zM", ufo.closeAllFolds, { desc = "Folds all code" })
		map("n", "<leader>zK", function()
			if not ufo.peekFoldedLinesUnderCursor() then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek fold under cursor" })
		map("n", "zm", "zc", { noremap = true, desc = "Folds code block under cursor" })
		map("n", "zr", "zo", { noremap = true, desc = "Opens folded code block under cursor" })
	end,
}
