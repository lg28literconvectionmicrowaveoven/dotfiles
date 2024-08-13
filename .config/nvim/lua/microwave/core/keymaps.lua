vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "$", "g_", { noremap = true })
map("i", "<C-bs>", '<C-o>"_dvb', { desc = "Ctrl + Backspace deletes a word behind the cursor" }) -- Cursor current character is also deleted. Only do so smartly (when current character is space?)
map("i", "<C-Del>", '<C-o>"_dw', { desc = "Ctrl + Backspace deletes a word in front of the cursor" })

-- Editor functions
map("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Hides search highlights" })
map("n", "<leader>+", "<C-a>", { desc = "Increments number under cursor" })
map("n", "<leader>-", "<C-x>", { desc = "Decrements number under cursor" })

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
map("n", "<leader>to", "<cmd>tabnew<bar>NvimTreeToggle<cr>", { desc = "Creates new tab and opens Nvim-Tree" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Closes current tab" })
map("n", "<leader>tl", "<cmd>tabn<cr>", { desc = "Switch to next tab" })
map("n", "<leader>th", "<cmd>tabp<cr>", { desc = "Switch to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })

-- Enter to create new line
map({ "n", "v" }, "<cr>", "m`o<Esc>``")

-- Nvim-Tree
map("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle file explorer on current file" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse file explorer" })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })

-- Nvim-Telescope
map("n", "<leader>ff", "<cmd>Telescope frecency<cr>", { desc = "Fuzzy find files in current working directory" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in current working directory" })
map(
	"n",
	"<leader>fc",
	"<cmd>Telescope grep_string<cr>",
	{ desc = "Find string under cursor in current working directory" }
)
map("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Search notification history" })

-- Auto-Session
map("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restores session for current working directory" })
map(
	"n",
	"<leader>ws",
	"<cmd>SessionSave<cr>",
	{ desc = "Save session for current working directory (into Neovim root)" }
)
