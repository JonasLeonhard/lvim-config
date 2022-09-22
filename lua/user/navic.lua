lvim.builtin.breadcrumbs.active = true
local navic_ok, navic = pcall(require, "nvim-navic")

if not navic_ok then
  return
end

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
