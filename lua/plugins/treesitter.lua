return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  ---@type TSConfig
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    modules = {}, -- pacifies typechecker
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "v",
        node_decremental = "K",
        node_incremental = "J",
        scope_incremental = "L",
      },
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
