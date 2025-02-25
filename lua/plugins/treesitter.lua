return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}
