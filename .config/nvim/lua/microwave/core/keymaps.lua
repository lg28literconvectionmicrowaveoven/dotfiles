vim.g.mapleader = " "
local map = vim.keymap.set

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
-- map("n", "<leader>to", "<cmd>tabnew<bar>NvimTreeToggle<cr>", { desc = "Creates new tab and opens Nvim-Tree" })
map("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Creates new tab and opens Nvim-Tree" })
map("n", "<leader>tx", "<cmd>BufferClose<cr>", { desc = "Closes current tab" })
map("n", "<leader>tl", "<cmd>BufferNext<cr>", { desc = "Switch to next tab" })
map("n", "<leader>th", "<cmd>BufferPrevious<cr>", { desc = "Switch to previous tab" })
map("n", "<leader>tt", "<cmd>BufferOrderByDirectory<cr>", { desc = "Reorder tabs by directory" })
map("n", "<leader>tH", "<cmd>BufferMovePrevious<cr>", { desc = "Move tab to the left" })
map("n", "<leader>tL", "<cmd>BufferMoveNext<cr>", { desc = "Move tab to the right" })
map(
	"n",
	"<leader>ta",
	"<cmd>BufferCloseAllButCurrentOrPinned<cr>",
	{ desc = "Close all tabs except pinned and current tabs" }
)
map("n", "<leader>tp", "<cmd>BufferPin<cr>", { desc = "Pin/unpin current buffer" })
map("n", "<leader>t1", "<cmd>BufferGoto 1<cr>", { desc = "Go to first tab" })
map("n", "<leader>t2", "<cmd>BufferGoto 2<cr>", { desc = "Go to second tab" })
map("n", "<leader>t3", "<cmd>BufferGoto 3<cr>", { desc = "Go to third tab" })
map("n", "<leader>t4", "<cmd>BufferGoto 4<cr>", { desc = "Go to fourth tab" })
map("n", "<leader>t5", "<cmd>BufferGoto 5<cr>", { desc = "Go to fifth tab" })
map("n", "<leader>t6", "<cmd>BufferGoto 6<cr>", { desc = "Go to sixth tab" })
map("n", "<leader>t7", "<cmd>BufferGoto 7<cr>", { desc = "Go to seventh tab" })
map("n", "<leader>t8", "<cmd>BufferGoto 8<cr>", { desc = "Go to eighth tab" })
map("n", "<leader>t9", "<cmd>BufferGoto 9<cr>", { desc = "Go to ninth tab" })
map("n", "<leader>t0", "<cmd>BufferLast<cr>", { desc = "Go to last tab" })

-- Enter to create new line
map({ "n", "v" }, "<C-cr>", "m`o<Esc>``")

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
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Search through TODOs" })

-- Auto-Session
map("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restores session for current working directory" })
map(
	"n",
	"<leader>ws",
	"<cmd>SessionSave<cr>",
	{ desc = "Save session for current working directory (into Neovim root)" }
)
