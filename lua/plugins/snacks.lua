return {
  "folke/snacks.nvim",
  event = "BufEnter",
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
    picker = {
      win = {
        input = {
          keys = {
            ["<M-s>"] = { "vsplit", mode = { "i", "n" }, desc = "Open in vertical split" },
          },
        },
      },
      sources = {
        ---@type snacks.picker.files.Config
        files = {
          finder = "files",
          format = "file",
          show_empty = true,
          hidden = true,
          follow = false,
          supports_live = true,
        },
        ---@type snacks.picker.grep.Config
        grep = {
          finder = "grep",
          regex = true,
          format = "file",
          show_empty = true,
          live = true,
          supports_live = true,
          hidden = true,
          exclude = { "*.lock", "*-lock.*" },
        },
        ---@type snacks.picker.help.Config
        help = {
          finder = "help",
          format = "text",
          previewers = {
            file = { ft = "help" },
          },
          win = { preview = { minimal = true } },
          confirm = "vertical help",
        },
      },
    },
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
