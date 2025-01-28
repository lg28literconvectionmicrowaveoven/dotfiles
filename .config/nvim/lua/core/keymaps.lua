vim.g.mapleader = " "
local map = vim.keymap.set

-- Exit from insert mode with escape in terminal
map("t", "<esc>", "<C-\\><C-n>")

-- Editor functions
map("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Hides search highlights" })
map("n", "+", "<C-a>", { desc = "Increments number under cursor" })
map("n", "-", "<C-x>", { desc = "Decrements number under cursor" })
map({ "n", "i", "v" }, "<F1>", "<nop>", { desc = "Unmaps F1 key" })
map("n", "<cr>", "m`o<Esc>``", { desc = "Enter to create new line" })

-- Window Management
map("n", "<A-x>", "<cmd>close<cr>", { desc = "Closes window in focus" })
map("n", "<A-d>", "<cmd>split<cr>", { desc = "Creates vertically split windows" })
map("n", "<A-r>", "<cmd>vsplit<cr>", { desc = "Creates horizontally split windows" })
map("n", "<A-e>", "<C-w>=", { desc = "Equalizes split window sizes" })
map("n", "<A-h>", "<C-w>h", { desc = "Focuses window to the left of the currently focused window" })
map("n", "<A-j>", "<C-w>j", { desc = "Focuses window above the currently focused window" })
map("n", "<A-k>", "<C-w>k", { desc = "Focuses window to the bottom of the currently focused window" })
map("n", "<A-l>", "<C-w>l", { desc = "Focuses window to the right of the currently focused window" })
map("n", "<A-C-h>", ':lua vim.notify("it work")')
-- map("n", "<A-C-h>", "<cmd>resize -5<cr>", { desc = "Decreases split width" })
-- map("n", "<A-C-l>", "<cmd>resize +5<cr>", { desc = "Increases split width" })
-- map("n", "<A-C-j>", "<cmd>vertical resize -5<cr>", { desc = "Decreases split height" })
-- map("n", "<A-C-k>", "<cmd>vertical resize +5<cr>", { desc = "Increases split height" })
-- map("n", "<A-H>", "<cmd>wincmd H<cr>", { desc = "Move window left" })
-- map("n", "<A-J>", "<cmd>wincmd J<cr>", { desc = "Move window down" })
-- map("n", "<A-K>", "<cmd>wincmd K<cr>", { desc = "Move window up" })
-- map("n", "<A-L>", "<cmd>wincmd L<cr>", { desc = "Move window right" })

-- Tab Management
map("n", "<C-n>", "<cmd>tabnew<cr>", { desc = "Creates new tab" })
map("n", "<C-x>", "<cmd>tabclose<cr>", { nowait = true, desc = "Closes current tab" })
map("n", "<C-l>", "<cmd>tabn<cr>", { desc = "Switch to next tab" })
map("n", "<C-h>", "<cmd>tabp<cr>", { desc = "Switch to previous tab" })
map("n", "<C-f>", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
