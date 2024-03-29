local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end
hop.setup();

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "L", ":HopWordCurrentLine<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })

keymap("n", "f",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
  , opts)
keymap("n", "F",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
  , opts)
keymap("n", "t",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>"
  , opts)
keymap("n", "T",
  ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>"
  , opts)
