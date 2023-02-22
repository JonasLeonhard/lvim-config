local ok = pcall(require, "catppuccin")
if not ok then
  return
end
local themeColors = require("catppuccin.palettes").get_palette "mocha";

-- highlight listchars (non whitespace, trailing whitespace, tab) :h listchars :h list
vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:·,nbsp:·"


print(vim.fn.expand('%'));
local highlightListchars = function()
  local filename = vim.fn.expand('%');

  -- skip highlighting for non-files (eg- alpha dashboard.)
  if (filename == '') then
    return
  end

  -- https://vim.fandom.com/wiki/Highlight_unwanted_spaces#Highlighting_with_the_match_command
  vim.cmd [[ syntax match NBSP " " ]] -- <-- INFO: this is a unicode nbsp character
  vim.cmd [[ syntax match TrailingSpaceChar /\s\+$/ ]]
  vim.api.nvim_set_hl(0, "NBSP",
    { fg = "White", bg = themeColors.red })
  vim.api.nvim_set_hl(0, "TrailingSpaceChar",
    { fg = "White", bg = themeColors.red })
end


local deHighlightListchars = function()
  -- https://vim.fandom.com/wiki/Highlight_unwanted_spaces#Highlighting_with_the_match_command
  vim.api.nvim_set_hl(0, "NBSP", {})
  vim.api.nvim_set_hl(0, "TrailingSpaceChar", {})
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = highlightListchars
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = deHighlightListchars
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = highlightListchars
})
