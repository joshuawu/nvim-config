-- disable netrw to avoid interfering with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("config.wsl") -- delete if not using WSL
require("config.python")

require("config.options")
require("config.mappings")
