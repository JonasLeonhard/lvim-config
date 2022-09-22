vim.o.guifont = "MesloLGSDZ Nerd Font:h15" --:h<FontSize>
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "material"
vim.g.material_theme_style = "darker"
vim.opt.relativenumber = true
vim.g.syntax_on = true
vim.o.syntax = "on"
lvim.builtin.autopairs.active = false

lvim.builtin.breadcrumbs.active = true
local navic = require("nvim-navic")
lvim.lsp.on_attach_callback = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end
local function getnavic()
  if navic.is_available() then
    return navic.get_location()
  else
    return
  end
end

lvim.builtin.lualine.sections.lualine_c = { { getnavic } }