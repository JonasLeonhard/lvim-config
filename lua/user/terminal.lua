lvim.builtin.terminal.active = true -- setup in terminal.lua
local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
  return
end

-- as of right now, neovide crashes when the width or height of a floating window increased beyond the actual window size.
lvim.builtin.terminal.float_opts = {
  width = 100000,
  height = 100000
}
lvim.builtin.terminal.open_mapping = "<C-t>"
