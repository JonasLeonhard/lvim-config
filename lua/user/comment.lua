local ok, ft = pcall(require, "Comment.ft")

if not ok then
  return
end

-- TODO: this does not override comments
ft.set('lua', { '--[[%s]]', '--[[%s]]' });
ft.set('html.twig', { '{#%s#}', '{#%s#}' });
