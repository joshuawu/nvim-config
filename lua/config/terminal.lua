-- See xterm control sequences at https://www.xfree86.org/4.8.0/ctlseqs.html

local CSI = "\027["

local META_SENDS_ESCAPE_MODE = 1036

local function get_decset(mode)
  return CSI .. "?" .. mode .. "h"
end

local function get_decrst(mode)
  return CSI .. "?" .. mode .. "l"
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    io.stdout:write(get_decset(META_SENDS_ESCAPE_MODE))
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    io.stdout:write(get_decrst(META_SENDS_ESCAPE_MODE))
  end,
})
