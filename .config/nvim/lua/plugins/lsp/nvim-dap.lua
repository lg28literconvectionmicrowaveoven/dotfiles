return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
	keys = {
		{ "<leader>dn", "<cmd>lua require('dap').continue()<CR>", desc = "Debug continue/start" },
		{ "<leader>dl", "<cmd>lua require('dap').step_over()<CR>", desc = "Debug step over" },
		{ "<leader>dj", "<cmd>lua require('dap').step_into()<CR>", desc = "Debug step into" },
		{ "<leader>dk", "<cmd>lua require('dap').step_out()<CR>", desc = "Debug step out" },
		{ "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Debug toggle breakpoint" },
	},
}
