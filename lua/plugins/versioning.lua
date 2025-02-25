return {
  {
    "SuperBo/fugit2.nvim",
    build = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      -- {
      --   "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
      --   dependencies = { "stevearc/dressing.nvim" },
      -- },
    },
    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    ---@class Fugit2Config
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
    config = function(_, opts)
      local ffi = require("ffi")
      local libgit2_dl_names = {
        "libgit2",
        "libgit2.so.1.7",
        "libgit2.so.1.5",
        "libgit2.so.1.1",
      }
      for _, name in ipairs(libgit2_dl_names) do
        if pcall(ffi.load, name) then
          opts.libgit2_path = name
        end
      end
      require("fugit2").setup(opts)
    end,
    keys = {
      { "<Leader>v", "<Cmd>Fugit2<CR>", desc = "Open git interface" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
    keys = {
      { "<Leader>b", "<Cmd>Gitsigns blame<CR>", desc = "Git blame" },
    },
  },
}
