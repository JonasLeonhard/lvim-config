local ok = pcall(require, "catppuccin")
if not ok then
  return
end
local themeColors = require("catppuccin.palettes").get_palette "mocha";

-- highlight listchars (non whitespace, trailing whitespace, tab) :h listchars :h list
vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:·,nbsp:·"

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      -- https://vim.fandom.com/wiki/Highlight_unwanted_spaces#Highlighting_with_the_match_command
      vim.cmd [[ match NBSP /\u00a0/ ]]
      vim.cmd [[ match TrailingSpaceChar /\s\+$/ ]]
      vim.api.nvim_set_hl(0, "NBSP",
          { fg = "White", bg = themeColors.red })
      vim.api.nvim_set_hl(0, "TrailingSpaceChar",
          { fg = "White", bg = themeColors.red })
    end
})
