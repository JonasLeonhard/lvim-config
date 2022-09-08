local ufold_ok, ufold = pcall(require, "ufo")
if (ufold_ok) then
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldenable = true
  vim.opt.foldlevelstart = 99

  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight FoldColumn guibg=#161616",
  })
  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight Folded guibg=#161616",
  })
  -- reset cursorLine to theme background, as folded / foldcolumn also alters cursorLine background
  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight CursorLine guibg=#212121",
  })

  ufold.setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  })
end
