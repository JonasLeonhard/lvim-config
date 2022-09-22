local indent_ok, indentBlankline = pcall(require, "indent_blankline")
if (indent_ok) then
  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight IndentBlanklineContextChar guifg=#7c7589 gui=nocombine",
  })
  lvim.builtin.indentlines.options = {
    show_current_context = true
  }
end
