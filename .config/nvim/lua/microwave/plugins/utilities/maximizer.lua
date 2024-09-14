return {
	"0x00-ketsu/maximizer.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local maximizer = require("maximizer")
		maximizer.setup()
		vim.keymap.set({ "n", "v" }, "<leader>sm", function()
			maximizer.toggle()
		end, { desc = "Maximize/Restore currently focused split" })
	end,
}
