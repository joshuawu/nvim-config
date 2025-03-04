vim.keymap.set(
  "n",
  "<Leader>,",
  "<Cmd>tabnew | tcd ~/.config/nvim | edit lua/config/mappings.lua<CR>",
  { desc = "Edit custom keymaps" }
)

vim.keymap.set("i", "jj", "<Esc>", { desc = "Switch to Normal mode" })

vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment/Uncomment line" })
vim.keymap.set("n", "<C-E>", "<C-W>d", { remap = true, desc = "Show diagnostics under cursor" })
vim.keymap.set("n", "<C-S>", ":w<CR>", { desc = "Save changes" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<Leader>]", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set("n", "<Leader>`", "<Cmd>vsplit +terminal<CR>i", { desc = "Open terminal" })

local mksession_cmd = "mksession! " .. vim.fn.getcwd(-1, -1) .. "/.session.vim"
vim.keymap.set("n", "<Leader>Q", "<Cmd>" .. mksession_cmd .. " | qall!<CR>", { desc = "Save session and force-quit" })
vim.keymap.set("n", "<Leader>q", "<Cmd>" .. mksession_cmd .. " | qall<CR>", { desc = "Save session and quit" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { desc = "Switch to Normal mode" })
vim.keymap.set("t", "jj", "<C-\\><C-N>", { desc = "Switch to Normal mode" })

vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment/Uncomment selected lines" })

vim.keymap.set({ "n", "v" }, "<Leader>a", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set({ "n", "v" }, "<C-_>", "<C-/>", { remap = true })

local all_modes = { "n", "i", "c", "x", "s", "o", "t", "l" }
vim.keymap.set(all_modes, "<M-H>", "<Esc><C-W>h", { remap = true, desc = "Move cursor to window left" })
vim.keymap.set(all_modes, "<M-J>", "<Esc><C-W>j", { remap = true, desc = "Move cursor to window below" })
vim.keymap.set(all_modes, "<M-K>", "<Esc><C-W>k", { remap = true, desc = "Move cursor to window above" })
vim.keymap.set(all_modes, "<M-L>", "<Esc><C-W>l", { remap = true, desc = "Move cursor to window right" })
