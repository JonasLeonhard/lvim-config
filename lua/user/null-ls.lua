-- null_ls builtins: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
local null_ls_ok, null_ls = pcall(require, "null-ls")
local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"
local codeActions = require "lvim.lsp.null-ls.code_actions"

if (null_ls_ok) then
  local prettierFiletypes = null_ls.builtins.formatting.prettier.filetypes
  table.insert(prettierFiletypes, "twig.html");
  table.insert(prettierFiletypes, "svelte");

  formatters.setup({
    {
      command = "prettier",
      filetypes = prettierFiletypes,
      extra_args = { "--print-with", "100" },
    },
  })

  local eslintFiletypes = null_ls.builtins.diagnostics.eslint.filetypes;
  table.insert(eslintFiletypes, "svelte");

  linters.setup({
    {
      command = "eslint",
      filetypes = eslintFiletypes
    },
  })

  codeActions.setup({
    {
      command = "eslint",
      filetypes = eslintFiletypes
    },
  })
end
