-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls_ok, null_ls = pcall(require, "null-ls")

if (null_ls_ok) then
  local formatters = require "lvim.lsp.null-ls.formatters"
  local prettierFiletypes = null_ls.builtins.formatting.prettier.filetypes
  table.insert(prettierFiletypes, 'htmldjango.twig');

  formatters.setup {
    {
      -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
      command = "prettier",
      filetypes = prettierFiletypes,
      extra_args = { "--print-with", "100" },
    },
  }

  -- -- set additional linters
  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { command = "eslint" },
  }
end
