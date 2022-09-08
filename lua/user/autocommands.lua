-- autocommands
vim.api.nvim_create_autocmd("BufEnter", {
  command = "syntax on", -- syntax_on/syntax does not work for some reason
});
