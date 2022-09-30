local ok, ft = pcall(require, "Comment.ft")

if not ok then
  return
end
ft.set('lua', { '--[[%s]]', '--[[%s]]' });
ft.set('html.twig', { '{#%s#}', '{#%s#}' });
