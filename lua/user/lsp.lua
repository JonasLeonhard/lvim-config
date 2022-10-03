local ok, lsp_manager = pcall(require, "lvim.lsp.manager")

if not ok then
  return
end

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local rust_analyzer = {
  capabilities = capabilities,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      -- enable clippy diagnostics on save
      checkOnSave = {
        command = "clippy"
      },
    }
  }
}
lsp_manager.setup("rust_analyzer", rust_analyzer)
