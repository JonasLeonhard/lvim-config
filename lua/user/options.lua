vim.g.syntax_on = true

vim.o.guifont = "MesloLGSDZ Nerd Font:h15" --:h<FontSize>
vim.o.syntax = "on"

vim.opt.relativenumber = true
vim.opt.conceallevel = 0 -- makes hidden whitespace visiable
vim.o.ch = 0 -- commandheight

lvim.format_on_save = true
lvim.log.level = "warn"
lvim.builtin.autopairs.active = false

lvim.builtin.bufferline.active = true
vim.opt.showtabline = 0

lvim.builtin.cmp.experimental.ghost_text = true
lvim.builtin.treesitter.highlight.enabled = true
