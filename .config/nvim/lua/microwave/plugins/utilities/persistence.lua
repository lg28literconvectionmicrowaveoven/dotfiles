return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = function()
		local persistence = require("persistence")
		local map = vim.keymap.set
		require("persistence").setup({
			options = { "globals" },
			pre_save = function()
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})
		map("n", "<leader>ws", function()
			persistence.save()
		end, { desc = "Save current session" })
		map("n", "<leader>wl", function()
			persistence.save()
		end, { desc = "List available sessions" })
		map("n", "<leader>wr", function()
			persistence.load()
		end, { desc = "Load last session" })
	end,
}
