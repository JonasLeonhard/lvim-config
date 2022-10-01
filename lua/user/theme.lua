local ok, catppuccin = pcall(require, "catppuccin")

if not ok then
  return
end

lvim.colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
  term_colors = true,
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
    notify = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dap = {
      enabled = true,
      enable_ui = true,
    },
    navic = {
      enabled = true,
      custom_bg = "NONE",
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
