vim.g.mapleader = " "
local map = vim.keymap.set

-- Editor functions
map("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Hides search highlights" })
map("n", "+", "<C-a>", { desc = "Increments number under cursor" })
map("n", "-", "<C-x>", { desc = "Decrements number under cursor" })
map({ "n", "i", "v" }, "<F1>", "<nop>", { desc = "Unmaps F1 key" })

-- Window Management
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Closes window in focus" })
map("n", "<leader>sd", "<cmd>split<cr>", { desc = "Creates vertically split windows" })
map("n", "<leader>sr", "<cmd>vsplit<cr>", { desc = "Creates horizontally split windows" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalizes split window sizes" })
map("n", "<leader>sh", "<C-w>h", { desc = "Focuses window to the left of the currently focused window" })
map("n", "<leader>sj", "<C-w>j", { desc = "Focuses window above the currently focused window" })
map("n", "<leader>sk", "<C-w>k", { desc = "Focuses window to the bottom of the currently focused window" })
map("n", "<leader>sl", "<C-w>l", { desc = "Focuses window to the right of the currently focused window" })

-- Tab Management
map("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Creates new tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Closes current tab" })
map("n", "<leader>tl", "<cmd>tabn<cr>", { desc = "Switch to next tab" })
map("n", "<leader>th", "<cmd>tabp<cr>", { desc = "Switch to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })

-- Enter to create new line
map({ "n", "v" }, "<cr>", "m`o<Esc>``")

-- Oil.nvim
map("n", "<leader>e", function()
	require("mini.files").open()
end, { desc = "Toggle Oil floating window" })

-- Nvim-Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in current working directory" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in current working directory" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Search through TODOs" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Fuzzy find help tags" })
map("n", "<leader>fc", "<cmd>Telescope neoclip<cr>", { desc = "Fuzzy find clipboard history" })
map("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Fuzzy find notification history" })

-- Nvim-GoMove
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
