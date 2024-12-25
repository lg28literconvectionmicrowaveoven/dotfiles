return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", " ➲ New File", "<cmd>ene<cr>"),
			dashboard.button("SPACE e", " ➲ Open file explorer", "<cmd>lua require('mini.files').open()<cr>"),
			dashboard.button("SPACE ff", "󰱼 ➲ Fuzzy find file", "<cmd>Telescope find_files<cr>"),
			dashboard.button("SPACE fs", " ➲ Fuzzy find word", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("q", " ➲ Quit NVIM", "<cmd>qa<cr>"),
		}
		require("alpha").setup(dashboard.opts)
		vim.cmd("autocmd FileType alpha setlocal nofoldenable")
	end,
}
