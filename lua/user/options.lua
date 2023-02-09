vim.g.syntax_on = true

vim.o.guifont = "MesloLGMDZ Nerd Font:h15" --:h<FontSize>
vim.o.syntax = "on"

vim.opt.relativenumber = true
vim.opt.conceallevel = 0 -- makes hidden whitespace visiable
vim.o.ch = 0 -- commandheight

lvim.format_on_save = true
lvim.log.level = "warn"
lvim.builtin.autopairs.active = false
lvim.use_icons = true

lvim.builtin.bufferline.active = true
vim.opt.showtabline = 0

lvim.builtin.cmp.experimental.ghost_text = true
lvim.builtin.treesitter.highlight.enabled = true

-- highlight listchars (non whitespace, trailing whitespace) :h listchars :h list
vim.opt.list = true;
vim.opt.listchars = 'trail:·,nbsp:·,'
vim.api.nvim_create_autocmd("BufEnter", {
  command = "highlight Whitespace guifg=White guibg=#F38BA8 ctermfg=White guibg=#F38BA8",
})

-- disable highlighting while typing (InsertMode)
vim.api.nvim_create_autocmd("InsertEnter", {
  command = "highlight Whitespace guifg=#45475a guibg=#212035",
})

-- enable highlighting while in normalMode
vim.api.nvim_create_autocmd("InsertLeave", {
  command = "highlight Whitespace guifg=White guibg=#F38BA8 ctermfg=White guibg=#F38BA8",
})
