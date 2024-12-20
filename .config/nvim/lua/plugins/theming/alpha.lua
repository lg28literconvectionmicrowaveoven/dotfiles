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
            dashboard.button("e", " ➲ New File", "<cmd>ene<CR>"),
            dashboard.button("SPACE ee", " ➲ Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPACE ff", "󰱼 ➲ Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPACE fs", " ➲ Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("SPACE wr", "󰁯 ➲ Restore Session For Current Directory ", "<cmd>SessionRestore<CR>"),
            dashboard.button("q", " ➲ Quit NVIM", "<cmd>qa<CR>"),
        }
        require("alpha").setup(dashboard.opts)
        vim.cmd("autocmd FileType alpha setlocal nofoldenable")
    end
}
