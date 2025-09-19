return {
  "stevearc/conform.nvim",
  event = "BufEnter",
  ---@type conform.setupOpts
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      sql = { "sqlfmt" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      kotlin = { "ktlint" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      graphql = { "prettierd" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
      css = { "prettierd" },
      ["_"] = { "prettierd" },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
