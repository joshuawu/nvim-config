return {
  {
    "SuperBo/fugit2.nvim",
    build = false,
    ---@class Fugit2Config
    ---@field width integer|string Main popup width
    ---@field max_width integer|string Main popup popup width when expand patch view
    ---@field min_width integer File view width when expand patch view
    ---@field content_width integer view content width
    ---@field height integer|string Main popup height
    ---@field show_patch boolean show patch for active file when open fugit2 main window
    ---@field libgit2_path string? path to libgit2 lib, default: "libgit2"
    ---@field gpgme_path string? path to gpgme lib, default: "gpgme"
    ---@field external_diffview boolean whether to use external diffview.nvim or Fugit2 implementation
    ---@field blame_priority integer priority of blame virtual text
    ---@field blame_info_width integer width of blame hunk detail popup
    ---@field blame_info_height integer height of blame hunk detail popup
    ---@field colorscheme string? custom color scheme override
    opts = {
      width = 100,
      min_width = 50,
      content_width = 60,
      max_width = "80%",
      height = "60%",
      external_diffview = false,
      blame_priority = 1,
      blame_info_height = 10,
      blame_info_width = 60,
      show_patch = true,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
        dependencies = { "stevearc/dressing.nvim" },
      },
    },
    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    -- keys = {
    --   { "<Leader>v", mode = "n", "<Cmd>Fugit2<CR>" },
    -- },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
}
