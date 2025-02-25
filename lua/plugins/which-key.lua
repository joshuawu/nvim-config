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
      scroll_down = "<A-j>",
      scroll_up = "<A-k>",
    },
  },
  keys = {
    {
      "<A-\\>",
      function()
        require("which-key").show()
      end,
      desc = "Show keymaps",
      mode = { "n", "i", "c", "x", "s", "o", "t", "l" },
    },
    {
      "<A-/>",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show keymaps for this buffer",
      mode = { "n", "i", "c", "x", "s", "o", "t", "l" },
    },
  },
}
