-- Setting `Leader` key
vim.keymap.set("", " ", "<Nop>", { noremap = true })
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Open file explorer
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Don't yank with `x`
vim.keymap.set("n", "x", '"_x', { desc = "Delete" })

-- Delete a word backwards
vim.keymap.set("n", "dw", 'bve"_d', { desc = "Delete word backwards" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-V>G", { desc = "Select all" })

-- Window management
vim.keymap.set("n", "<Leader>k", ":split<CR><C-w>w", { desc = "Horizonatal split" })
vim.keymap.set("n", "<Leader>l", ":vsplit<CR><C-w>w", { desc = "Vertical split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- Resize window
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Shrink horizontal split" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Enlarge horizontal split" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Shrink vertical split" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Enlarge vertical split" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Navigate to previous buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Navigate to next buffer" })

-- Center In-Buffer navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })

-- Center Search results navigation
vim.keymap.set("n", "n", "nzz", { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzz", { desc = "Go to previous search result" })

-- Move current selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep selection after indenting
vim.keymap.set("x", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right" })
-- Indent with Tab
vim.keymap.set("x", "<S-Tab>", "<gv", { desc = "Indent left" })
vim.keymap.set("x", "<Tab>", ">gv", { desc = "Indent right" })

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
