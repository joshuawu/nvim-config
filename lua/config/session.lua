local function get_should_delete_modified_buffers(prompt, callback)
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name == "" then
      if vim.api.nvim_get_option_value("modified", { buf = buf }) then
        vim.ui.select({ "Yes", "No" }, { prompt = prompt }, function(choice)
          callback(choice == "Yes")
        end)
        return
      end
    end
  end
  callback(true)
end

local function close_unnamed_buffers()
  local wins = vim.api.nvim_list_wins()
  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name == "" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

local function save_and_quit(force)
  local function callback()
    vim.api.nvim_cmd({
      cmd = "mksession",
      bang = true,
      args = { vim.fn.getcwd(-1, -1) .. "/.session.vim" },
    }, {})
    vim.api.nvim_cmd({ cmd = "qall", bang = force }, {})
  end
  if force then
    close_unnamed_buffers()
    callback()
  else
    get_should_delete_modified_buffers("Delete unsaved buffers?", function(should_delete)
      if should_delete then
        close_unnamed_buffers()
        callback()
      end
    end)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    if vim.fn.argc(-1) == 0 then
      vim.api.nvim_cmd({
        cmd = "source",
        args = { vim.fn.getcwd(-1, -1) .. "/.session.vim" },
        mods = { emsg_silent = true },
      }, {})
    end
  end,
})

vim.keymap.set("n", "<Leader>q", function()
  save_and_quit(false)
end, { desc = "Save session and quit" })
vim.keymap.set("n", "<Leader>Q", function()
  save_and_quit(true)
end, { desc = "Save session and force-quit" })
