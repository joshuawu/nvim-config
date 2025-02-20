vim.keymap.set("n", "<Leader>t", ":NvimTreeFindFileToggle<CR>")

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<Leader>f", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>g", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>h", telescope.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<Leader>b", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Leader>?", telescope.keymaps, { desc = "Telescope key maps" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function(event)
		vim.keymap.set("n", "<Leader>]", ":TSToolsGoToSourceDefinition<CR>", { buffer = event.buf })
	end,
})

vim.keymap.set("n", "<F7>", ":silent! cp<CR>:cc<CR>")
vim.keymap.set("n", "<F8>", ":silent! cn<CR>:cc<CR>")
vim.keymap.set("i", "jj", "<Esc>")
