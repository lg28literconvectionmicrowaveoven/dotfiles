return {
	"mfussenegger/nvim-dap",
	config = function()
		local map = vim.keymap.set
		local dap = require("dap")
		map("n", "<leader>dc", function()
			dap.continue()
		end)
		map("n", "<leader>dl", function()
			dap.step_over()
		end)
		map("n", "<leader>dj", function()
			dap.step_into()
		end)
		map("n", "<leader>dk", function()
			dap.step_out()
		end)
		map("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end)
	end,
}
