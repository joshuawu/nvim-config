vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    vim.api.nvim_cmd({
      cmd = "source",
      args = { vim.fn.getcwd(-1, -1) .. "/.session.vim" },
      mods = { emsg_silent = true },
    }, {})
  end,
})
