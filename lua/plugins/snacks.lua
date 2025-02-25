return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {},
    input = {
      win = {
        relative = "cursor",
        row = -3,
        col = 0,
      },
    },
    picker = {},
  },
  keys = {
    {
      "<Leader>t",
      function()
        Snacks.explorer.open()
      end,
      desc = "Toggle file explorer",
    },
    {
      "<Leader><Leader>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find files",
    },
    {
      "<Leader>f",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live grep",
    },
    {
      "<Leader>h",
      function()
        Snacks.picker.help()
      end,
      desc = "Find help",
    },
    {
      "<Leader>p",
      function()
        Snacks.picker.pickers()
      end,
      desc = "Show all pickers",
    },
    {
      "<Leader>r",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "Find references",
    },
  },
}
