return {
  "folke/trouble.nvim",
  ---@type trouble.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    modes = {
      ---@type trouble.Config
      ---@diagnostic disable-next-line: missing-fields
      diagnostics = {
        auto_open = true,
        auto_close = true,
        win = {
          type = "float",
          relative = "editor",
          border = "rounded",
          size = { width = 80, height = 10 },
          position = { 0.9, 0.5 },
          title = "Diagnostics",
          title_pos = "center",
          footer = "<F7> Prev / <F8> Next",
          footer_pos = "center",
        },
        filter = function(items)
          return vim.tbl_filter(function(item)
            -- HACK: Ignore buggy GraphQL validation error message
            return not vim.startswith(item.message, "Unknown fragment ")
          end, items)
        end,
      },
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<F7>",
      function()
        local trouble = require("trouble")
        trouble.prev()
        trouble.jump_only()
      end,
      desc = "Go to previous error",
    },
    {
      "<F8>",
      function()
        local trouble = require("trouble")
        trouble.next()
        trouble.jump_only()
      end,
      desc = "Go to next error",
    },
  },
}
