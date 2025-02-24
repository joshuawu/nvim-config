return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({})
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = "NvimTree*",
      callback = function()
        if not require("nvim-tree.view").is_visible() then
          require("nvim-tree.api").tree.open()
        end
      end,
    })
  end,
}
