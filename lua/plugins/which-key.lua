---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@class wk.Opts
  opts = {
    preset = "helix",
    filter = function(mapping)
      return mapping.desc
    end,
    sort = { "alphanum" },
    keys = {
      scroll_down = "<M-j>",
      scroll_up = "<M-k>",
    },
  },
  keys = {
    {
      "<M-\\>",
      function()
        require("which-key").show()
      end,
      desc = "Show keymaps",
      mode = { "n", "i", "c", "x", "s", "o", "t", "l" },
    },
    {
      "<M-/>",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show keymaps for this buffer",
      mode = { "n", "i", "c", "x", "s", "o", "t", "l" },
    },
  },
}
