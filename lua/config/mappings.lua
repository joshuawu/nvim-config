vim.keymap.set("i", "jj", "<Esc>", { desc = "Switch to Normal mode" })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment/Uncomment line" })
vim.keymap.set("n", "<C-S>", ":w<CR>", { desc = "Save changes" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set(
  "n",
  "<Leader>,",
  "<Cmd>tabnew | tcd ~/.config/nvim | edit lua/config/mappings.lua<CR>",
  { desc = "Edit custom keymaps" }
)
vim.keymap.set("n", "<Leader>]", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set("n", "<Leader>`", "<Cmd>vsplit +terminal<CR>i", { desc = "Open terminal" })
local mksession_cmd = "mksession! " .. vim.fn.getcwd(-1, -1) .. "/.session.vim"
vim.keymap.set("n", "<Leader>Q", "<Cmd>" .. mksession_cmd .. " | qall!<CR>", { desc = "Save session and force-quit" })
vim.keymap.set("n", "<Leader>q", "<Cmd>" .. mksession_cmd .. " | qall<CR>", { desc = "Save session and quit" })
vim.keymap.set("n", "<M-S-h>", "<C-W>h", { desc = "Move cursor to window left" })
vim.keymap.set("n", "<M-S-j>", "<C-W>j", { desc = "Move cursor to window below" })
vim.keymap.set("n", "<M-S-k>", "<C-W>k", { desc = "Move cursor to window above" })
vim.keymap.set("n", "<M-S-l>", "<C-W>l", { desc = "Move cursor to window right" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "Switch to Normal mode" })
vim.keymap.set("t", "jj", "<C-\\><C-N>", { desc = "Switch to Normal mode" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment/Uncomment selected lines" })
vim.keymap.set({ "n", "v" }, "<Leader>a", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set({ "n", "v" }, "<C-_>", "<C-/>", { remap = true })
