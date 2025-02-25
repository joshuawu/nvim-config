vim.keymap.set("n", "<Leader>b", "<Cmd>Gitsigns blame<CR>")
vim.keymap.set("n", "<Leader>v", "<Cmd>Fugit2<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function(event)
    vim.keymap.set("n", "<Leader>]", "<Cmd>TSToolsGoToSourceDefinition<CR>", { buffer = event.buf })
  end,
})

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("n", "<C-_>", "<C-/>", { remap = true })
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
vim.keymap.set("v", "<C-_>", "<C-/>", { remap = true })
