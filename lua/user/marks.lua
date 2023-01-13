local marks_ok, marks = pcall(require, "marks")

if not marks_ok then
  return
end

marks.setup({
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 300,
  -- whether the shada file is updated after modifying marks. default false. Without this cleared marks are reloaded after saving.
  force_write_shada = true,
  sign_priority = 100
})
