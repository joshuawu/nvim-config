vim.keymap.set("i", "jj", "<Esc>", { desc = "Switch to Normal mode" })
vim.keymap.set("i", "<C-_>", "<C-/>", { remap = true })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment/Uncomment line" })
vim.keymap.set("n", "<C-_>", "<C-/>", { remap = true })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<F7>", "<Cmd>silent! cp | cc<CR>", { desc = "Go to previous error" })
vim.keymap.set("n", "<F8>", "<Cmd>silent! cn | cc<CR>", { desc = "Go to next error" })
vim.keymap.set(
  "n",
  "<Leader>,",
  "<Cmd>tabnew | tcd ~/.config/nvim | edit lua/config/mappings.lua<CR>",
  { desc = "Edit custom keymaps" }
)
vim.keymap.set("n", "<Leader>`", "<Cmd>vsplit +terminal<CR>i", { desc = "Open terminal" })
local mksession_cmd = "mksession! " .. vim.fn.getcwd(-1, -1) .. "/.session.vim"
vim.keymap.set("n", "<Leader>Q", "<Cmd>" .. mksession_cmd .. " | qall!<CR>", { desc = "Save session and force-quit" })
vim.keymap.set("n", "<Leader>q", "<Cmd>" .. mksession_cmd .. " | qall<CR>", { desc = "Save session and quit" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Switch to Normal mode" })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Switch to Normal mode" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment/Uncomment selected lines" })
vim.keymap.set("v", "<C-_>", "<C-/>", { remap = true })
