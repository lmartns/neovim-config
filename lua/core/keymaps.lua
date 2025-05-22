-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" }) -- move selected line(s) down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" })   -- move selected line(s) up

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')

keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Choose buffer to close" })

keymap.set("n", "<leader>bx", "<cmd>bp|bd #<CR>", { desc = "Close buffer but keep window" })

keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick a buffer" })

keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Open floating terminal" })

keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Open horizontal terminal" })

keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Open vertical terminal" })

vim.keymap.set("n", "<Tab>", "i<Tab><Esc>l", { noremap = true })

keymap.set({ "n", "v" }, "y", '"+y', { noremap = true })
keymap.set("n", "yy", '"+yy', { noremap = true })
