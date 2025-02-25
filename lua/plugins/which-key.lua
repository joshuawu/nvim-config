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
  },
  keys = {
    {
      "<Leader>/",
      function()
        require("which-key").show()
      end,
      desc = "Show all keymaps",
    },
    {
      "<Leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show keymaps for this buffer",
    },
    {
      "<C-/>",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show keymaps for this buffer",
      mode = "i",
    },
  },
}
