vim.g.catppuccin_flavour = "mocha"
vim.g.syntax_on = true

vim.o.guifont = "MesloLGSDZ Nerd Font:h15" --:h<FontSize>
vim.o.syntax = "on"

vim.opt.relativenumber = true
vim.opt.conceallevel = 0 -- makes hidden whitespace visiable
vim.opt.undofile = true -- persisten undo
vim.opt.smartindent = true
vim.opt.smartcase = true

lvim.format_on_save = true
lvim.colorscheme = "catppuccin"
lvim.log.level = "warn"
lvim.builtin.autopairs.active = false
lvim.builtin.cmp.experimental.ghost_text = true
lvim.builtin.treesitter.highlight.enabled = true
