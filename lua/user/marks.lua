local marks_ok, marks = pcall(require, "marks")

if not marks_ok then
  return
end

marks.setup({
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 300,
})
