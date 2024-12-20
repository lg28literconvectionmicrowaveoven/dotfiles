return {
	"mfussenegger/nvim-dap",
	config = function()
		local map = vim.keymap.set
		local dap = require("dap")
		map("n", "<leader>dn", function()
			dap.continue()
		end, { desc = "Debug continue/start" })
		map("n", "<leader>dl", function()
			dap.step_over()
		end, { desc = "Debug step over" })
		map("n", "<leader>dj", function()
			dap.step_into()
		end, { desc = "Debug step into" })
		map("n", "<leader>dk", function()
			dap.step_out()
		end, { desc = "Debug step out" })
		map("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "Debug toggle breakpoint" })
	end,
}
