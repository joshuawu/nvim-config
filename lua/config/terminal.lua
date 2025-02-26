-- See xterm control sequences at https://www.xfree86.org/4.8.0/ctlseqs.html

local CSI = "\027["
local OSC = "\027]"
local ST = "\027\\"

local META_SENDS_ESCAPE_MODE = 1036
local SET_WINDOW_TITLE_OSC = 0

local home_dir = vim.fn.expand("~")
local global_wd = vim.fn.getcwd(-1, -1)
local relative_global_wd = global_wd:gsub("^" .. home_dir, "~")

local function get_decset(mode)
  return CSI .. "?" .. mode .. "h"
end

local function get_decrst(mode)
  return CSI .. "?" .. mode .. "l"
end

local function get_osc(command, value)
  return OSC .. command .. ";" .. value .. ST
end

local function get_window_title()
  local relative_cwd = vim.fn.getcwd():gsub("^" .. home_dir, "~")
  if relative_cwd ~= relative_global_wd then
    relative_cwd = "(" .. relative_global_wd .. ") " .. relative_cwd
  end
  local filename = vim.fn.expand("%:.")
  if filename == "" then
    filename = "[No Name]"
  end
  return "nvim " .. relative_cwd .. ": " .. filename
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    io.stdout:write(get_decset(META_SENDS_ESCAPE_MODE))
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    io.stdout:write(get_decrst(META_SENDS_ESCAPE_MODE))
    io.stdout:write(get_osc(SET_WINDOW_TITLE_OSC, relative_global_wd))
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "SessionLoadPost" }, {
  callback = function()
    io.stdout:write(get_osc(SET_WINDOW_TITLE_OSC, get_window_title()))
  end,
})
