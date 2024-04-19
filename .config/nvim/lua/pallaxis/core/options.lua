local opt = vim.opt
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces

vim.api.nvim_set_option("clipboard", "unnamed") -- copying in wayland
