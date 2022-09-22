lvim.builtin.terminal.active = true -- setup in terminal.lua
local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
  return
end

-- lvim.builtin.terminal.float_opts = {
--   width = 100,
--   height = 100
-- } -- TODO: get full width / height
lvim.builtin.terminal.open_mapping = "<C-/>"
lvim.builtin.terminal.open_mapping = "<C-7>"
