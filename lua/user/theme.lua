local ok, catppuccin = pcall(require, "catppuccin")

if not ok then
  return
end

catppuccin.setup({
  integrations = {
    cmp = true,
    fidget = true,
    gitgutter = true,
    gitsigns = true,
    hop = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})
