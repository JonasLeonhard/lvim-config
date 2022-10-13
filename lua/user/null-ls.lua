-- null_ls builtins: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
local null_ls_ok, null_ls = pcall(require, "null-ls")
local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"
local codeActions = require "lvim.lsp.null-ls.code_actions"

if (null_ls_ok) then
  local prettierFiletypes = null_ls.builtins.formatting.prettier.filetypes
  table.insert(prettierFiletypes, "twig.html");
  formatters.setup({
    {
      command = "prettier",
      filetypes = prettierFiletypes,
      extra_args = { "--print-with", "100" },
    },
  })

  linters.setup({
    { command = "eslint" },
  })

  codeActions.setup({
    { command = "eslint" },
  })
end
