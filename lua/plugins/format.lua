return {
  "stevearc/conform.nvim",
  event = "BufEnter",
  config = function()
    require("conform").setup({
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
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
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        ["_"] = { "prettierd" },
      },
    })
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
