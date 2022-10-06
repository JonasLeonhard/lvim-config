local signature_ok, lsp_signature = pcall(require, "lsp_signature");

if not signature_ok then
  return
end

lsp_signature.setup({
  floating_window = false,
  hint_enable = true,
  always_trigger = false,
  hint_prefix = ""
})
