lvim.builtin.treesitter.context_commentstring.enable = true

local ft_ok, ft = pcall(require, "Comment.ft")
local utils_ok, comment_utils = pcall(require, "Comment.utils")
if not ft_ok or not utils_ok then
  return
end

lvim.builtin.comment.pre_hook = function(ctx)
  -- Custom comments for filetypes
  ft.set('html.twig', { '{#%s#}', '{#%s#}' })

  -- Integrate with ts_context_commentstring
  if not vim.tbl_contains({ "javascript", "javascriptreact", "typescript", "typescriptreact" }, vim.bo.ft) then
    return
  end

  local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

  local location
  if ctx.ctype == comment_utils.ctype.block then
    location = require("ts_context_commentstring.utils").get_cursor_location()
  elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
    location = require("ts_context_commentstring.utils").get_visual_start_location()
  end

  return require("ts_context_commentstring.internal").calculate_commentstring {
    key = type,
    location = location,
  }
end
