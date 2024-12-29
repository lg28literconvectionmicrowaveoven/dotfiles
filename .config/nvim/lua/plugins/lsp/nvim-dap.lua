return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
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
		-- dap.listeners.before.event_terminated.dapui_config = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited.dapui_config = function()
		-- 	dapui.close()
		-- end
		vim.fn.sign_define("DapBreakpoint", {
			text = "●",
			texthl = "DapBreakpointSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"python",
				"delve",
				"cpptools",
				"firefox",
				"js",
				"bash",
				"kotlin",
				"dart",
				"javadbg",
				"javatest",
			},
			handlers = {},
		})
	end,
	keys = {
		{ "<leader>dn", "<cmd>lua require('dap').continue()<CR>", desc = "Debug continue/start" },
		{ "<leader>dl", "<cmd>lua require('dap').step_over()<CR>", desc = "Debug step over" },
		{ "<leader>dj", "<cmd>lua require('dap').step_into()<CR>", desc = "Debug step into" },
		{ "<leader>dk", "<cmd>lua require('dap').step_out()<CR>", desc = "Debug step out" },
		{ "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Debug toggle breakpoint" },
		{ "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle nvim-dap-ui" },
	},
}
