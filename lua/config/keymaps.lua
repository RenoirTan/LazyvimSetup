-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Intra-editor
map({ "n", "v" }, "<C-Left>", "<C-S-Left>", { desc = "Jump one word to the left", noremap = true })
map({ "n", "v" }, "<C-Right>", "<C-S-Right>", { desc = "Jump one word to the right", noremap = true })

-- Switch windows
map("n", "<C-S-Left>", "<C-w>h", { desc = "Go to Left Window", noremap = true })
map("n", "<C-S-Down>", "<C-w>j", { desc = "Go to Lower Window", noremap = true })
map("n", "<C-S-Up>", "<C-w>k", { desc = "Go to Upper Window", noremap = true })
map("n", "<C-S-Right>", "<C-w>l", { desc = "Go to Right Window", noremap = true })

-- Switch buffers
map("n", "<leader><Right>", ":bnext<CR>", { desc = "Next Tab", noremap = true, silent = true })
map("n", "<leader><Left>", ":bprevious<CR>", { desc = "Previous Tab", noremap = true, silent = true })
map("n", "<leader>W", function()
  Snacks.bufdelete()
end, { desc = "Close This Tab", noremap = true, silent = true })
map("n", "<leader>N", ":enew<CR>", { desc = "New Tab", noremap = true, silent = true })
map("n", "<leader><S-Left>", ":BufferLineMovePrev<CR>", { desc = "Move Tab Left", noremap = true, silent = true })
map("n", "<leader><S-Right>", ":BufferLineMoveNext<CR>", { desc = "Move Tab Left", noremap = true, silent = true })
map("n", "ts", ":BufferLinePick<CR>", { desc = "Switch Tabs", noremap = true, silent = true })
map("n", "td", ":BufferLinePickClose<CR>", { desc = "Close Tab", noremap = true, silent = true })

-- Copy and paste
map({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy", noremap = true })
map({ "n", "v" }, "<C-x>", '"+x', { desc = "Cut", noremap = true })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Delete", noremap = true })
map({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select all", noremap = true })

-- Quick global shortcuts
map("n", "<leader>R", ":luafile ~/.config/nvim/init.lua<CR>", { desc = "Reload Neovim", noremap = true, silent = true })

-- LSP
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename variable" })
