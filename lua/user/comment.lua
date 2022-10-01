lvim.builtin.comment.pre_hook = function()
  local ok, ft = pcall(require, "Comment.ft")
  if not ok then
    return
  end
  ft.set('html.twig', { '{#%s#}', '{#%s#}' })
end
