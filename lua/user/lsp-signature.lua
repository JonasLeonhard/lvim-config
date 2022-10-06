local signature_ok, lsp_signature = pcall(require, "lsp_signature");

if not signature_ok then
  return
end

lsp_signature.setup({
  floating_window = false,
  hint_enable = false,
  always_trigger = false,
  hint_prefix = ""
})

local current_signature = function(width)
  if not pcall(require, 'lsp_signature') then return end
  local sig = require("lsp_signature").status_line(width)
  if sig.label == "" then
    return ""
  end
  return sig.label .. "  " .. sig.hint
end

lvim.builtin.lualine.sections.lualine_c = { { function() return current_signature() end } };
