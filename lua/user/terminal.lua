local M = {};

lvim.builtin.terminal.active = true -- setup in terminal.lua
local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
  return M
end

-- as of right now, neovide crashes when the width or height of a floating window increased beyond the actual window size.
lvim.builtin.terminal.float_opts = {
  width = 100000,
  height = 100000
}
lvim.builtin.terminal.open_mapping = "<C-t>"

-- open via { "<cmd>lua require 'user.terminal'.giui_toggle()<cr>", "Gitui" }
M.gitui_toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local gitui = Terminal:new {
    cmd = "gitui",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }
  gitui:toggle()
end

return M;
