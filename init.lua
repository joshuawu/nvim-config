-- disable netrw to avoid interfering with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lua_path = vim.fn.stdpath("config") .. "/lua/"
local configs = vim.fn.glob(lua_path .. "config/**/*.lua", true, true)
for _, config in ipairs(configs) do
  local module_name = config:gsub("^" .. lua_path, ""):gsub("%.lua$", ""):gsub("/", ".")
  require(module_name)
end
