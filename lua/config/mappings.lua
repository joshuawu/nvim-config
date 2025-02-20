vim.keymap.set("n", "<Leader>t", ":NvimTreeFindFileToggle<CR>")

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader><Leader>", telescope_builtin.builtin, { desc = "Telescope built-in pickers" })
vim.keymap.set("n", "<Leader>f", telescope_builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<Leader>g", telescope_builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<Leader>h", telescope_builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<Leader>b", telescope_builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<Leader>?", telescope_builtin.keymaps, { desc = "Telescope key maps" })
vim.keymap.set("n", "<Leader>r", telescope_builtin.lsp_references, { desc = "Telescope find all references" })
vim.keymap.set(
	"n",
	"<Leader>v",
	telescope.extensions.git_file_history.git_file_history,
	{ desc = "Telescope file version history" }
)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function(event)
		vim.keymap.set("n", "<Leader>]", ":TSToolsGoToSourceDefinition<CR>", { buffer = event.buf })
	end,
})

vim.keymap.set("n", "<F7>", ":silent! cp<CR>:cc<CR>")
vim.keymap.set("n", "<F8>", ":silent! cn<CR>:cc<CR>")
vim.keymap.set("i", "jj", "<Esc>")
