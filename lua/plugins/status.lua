---@type LazyPluginSpec
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { "trouble" },
      },
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
