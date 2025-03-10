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
          size = { width = 32, height = 16 },
          position = { 0.02, 1 },
          border = "rounded",
          title = "<Leader>x Toggle",
          title_pos = "right",
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
  config = function(_, config)
    require("trouble").setup(config)
    local prev_opts = {}
    local prev_win_opts = {}
    local function toggle_diagnostics_position()
      local win = require("trouble.view").get({ mode = "diagnostics" })[1].view.win
      if not win.win then
        return
      end
      local win_opts = vim.api.nvim_win_get_config(win.win)
      local opts = win.opts
      if opts.type == "float" then
        prev_opts.float = vim.fn.copy(opts)
        prev_win_opts.float = win_opts
        if prev_opts.split then
          win.opts = prev_opts.split
          opts = win.opts
        else
          ---@type trouble.Window.split
          ---@diagnostic disable-next-line: assign-type-mismatch
          opts = opts
          opts.type = "split"
          opts.size = prev_opts.split and prev_opts.split.size or 8
          opts.position = prev_opts.split and prev_opts.split.position or "bottom"
          ---@diagnostic disable-next-line: inject-field
          opts.win = -1
        end
        vim.api.nvim_win_set_config(
          win.win,
          vim.tbl_extend("force", prev_win_opts.split or {}, {
            win = -1,
            relative = "",
            split = "below",
            height = opts.size,
          })
        )
      elseif opts.type == "split" then
        prev_opts.split = vim.fn.copy(opts)
        prev_win_opts.split = win_opts
        if prev_opts.float then
          win.opts = prev_opts.float
          opts = win.opts
        else
          ---@type trouble.Window.float
          ---@diagnostic disable-next-line: assign-type-mismatch
          opts = opts
          opts.type = "float"
          opts.size = prev_opts.float and prev_opts.float.size or { width = 32, height = 16 }
          opts.position = prev_opts.float and prev_opts.float.position or { 0.9, 0.5 }
        end
        local y = opts.position[1]
        local x = opts.position[2]
        local height = opts.size.height <= 1 and math.floor(vim.o.lines * opts.size.height) or opts.size.height
        local width = opts.size.width <= 1 and math.floor(vim.o.columns * opts.size.width) or opts.size.width
        local row = math.abs(y) <= 1 and math.floor((vim.o.lines - height) * y) or y
        row = row < 0 and (vim.o.lines + row) or row
        local col = math.abs(x) <= 1 and math.floor((vim.o.columns - width) * x) or x
        col = col < 0 and (vim.o.columns + col) or col
        vim.api.nvim_win_set_config(
          win.win,
          vim.tbl_extend("force", prev_win_opts.float or {}, {
            relative = "editor",
            row = row,
            col = col,
            width = width,
            height = height,
          })
        )
      end
    end
    vim.keymap.set("n", "<Leader>x", toggle_diagnostics_position, { desc = "Toggle diagnostics position" })
  end,
  cmd = "Trouble",
  keys = {
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Toggle symbols explorer",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Toggle LSP info explorer",
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
    -- {
    --   "<leader>xx",
    --   "<cmd>Trouble diagnostics toggle<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "<leader>xX",
    --   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --   desc = "Buffer Diagnostics (Trouble)",
    -- },
    -- {
    --   "<leader>xL",
    --   "<cmd>Trouble loclist toggle<cr>",
    --   desc = "Location List (Trouble)",
    -- },
    -- {
    --   "<leader>xQ",
    --   "<cmd>Trouble qflist toggle<cr>",
    --   desc = "Quickfix List (Trouble)",
    -- },
  },
}
