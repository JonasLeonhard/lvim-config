lvim.builtin.terminal.active = true -- setup in terminal.lua
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

-- lvim.builtin.terminal.float_opts = {
--   width = 100,
--   height = 100
-- } -- TODO: get full width / height
lvim.builtin.terminal.open_mapping = "<C-t>"
