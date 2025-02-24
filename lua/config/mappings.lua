vim.keymap.set("n", "<Leader>t", "<Cmd>NvimTreeFindFileToggle<CR>")

-- local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader><Leader>", telescope_builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>?", telescope_builtin.keymaps, { desc = "Telescope key maps" })
vim.keymap.set("n", "<Leader>b", "<Cmd>Gitsigns blame<CR>")
vim.keymap.set("n", "<Leader>f", telescope_builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>h", telescope_builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<Leader>p", telescope_builtin.builtin, { desc = "Telescope built-in pickers" })
vim.keymap.set("n", "<Leader>r", telescope_builtin.lsp_references, { desc = "Telescope find all references" })
vim.keymap.set("n", "<Leader>v", "<Cmd>Fugit2<CR>")
-- vim.keymap.set(
--   "n",
--   "<Leader>vh",
--   telescope.extensions.git_file_history.git_file_history,
--   { desc = "Telescope file version history" }
-- )

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function(event)
    vim.keymap.set("n", "<Leader>]", "<Cmd>TSToolsGoToSourceDefinition<CR>", { buffer = event.buf })
  end,
})

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<F7>", "<Cmd>silent! cp | cc<CR>")
vim.keymap.set("n", "<F8>", "<Cmd>silent! cn | cc<CR>")
vim.keymap.set("n", "<Leader>,", "<Cmd>tabnew | tcd ~/.config/nvim | edit lua/config/mappings.lua<CR>")
vim.keymap.set("n", "<Leader>`", "<Cmd>vsplit +terminal<CR>i")
local mksession_cmd = "mksession! " .. vim.fn.getcwd(-1, -1) .. "/.session.vim"
vim.keymap.set("n", "<Leader>Q", "<Cmd>" .. mksession_cmd .. " | qall!<CR>")
vim.keymap.set("n", "<Leader>q", "<Cmd>" .. mksession_cmd .. " | qall<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")
vim.keymap.set("v", "<C-/>", "gc", { remap = true })
