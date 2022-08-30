--[[
lvim is the global options object - based on lvim example config.
]]

-- general
vim.o.guifont = "MesloLGSDZ Nerd Font"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "material"
vim.g.material_theme_style = "darker"
vim.opt.relativenumber = true

-- neovide
vim.g.neovide_cursor_animation_length = 0.025

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- save
lvim.keys.normal_mode["<esc>"] = ":noh<cr>" -- clear ?: searches with esc

-- User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell", "phpdoc" }
lvim.builtin.treesitter.highlight.enabled = true

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    extra_args = { "--print-with", "100" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint" },
}

-- Additional Plugins
lvim.plugins = {
  -- Theme
  { "kaicataldo/material.vim" },
  -- Navigation
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  -- In-Editor
  { "lukas-reineke/indent-blankline.nvim" },
  { "petertriho/nvim-scrollbar" },
  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- Syntax (non-lsp)
  { 'lumiliet/vim-twig' },
  { 'windwp/nvim-ts-autotag' }
}

-- Plugin Setups - TODO: why is config not working?
local scrollbar_ok, scrollbar = pcall(require, "scrollbar")
if (scrollbar_ok) then
  scrollbar.setup()
end

local ufold_ok, ufold = pcall(require, "ufo")
if (ufold_ok) then
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldenable = true
  vim.opt.foldlevelstart = 99

  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight FoldColumn guibg=#161616",
  })
  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight Folded guibg=#161616",
  })
  -- reset cursorLine to theme background, as folded / foldcolumn also alters cursorLine background
  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight CursorLine guibg=#212121",
  })

  ufold.setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  })
end

local todo_ok, todo = pcall(require, "todo-comments")
if (todo_ok) then
  todo.setup()
end

local colorizer_ok, colorizer = pcall(require, "colorizer")
if (colorizer_ok) then
  colorizer.setup()
end

local indent_ok, indentBlankline = pcall(require, "indent_blankline")
if (indent_ok) then
  vim.api.nvim_create_autocmd("BufEnter", {
    command = "highlight IndentBlanklineContextChar guifg=#7c7589 gui=nocombine",
  })
  indentBlankline.setup({
    show_current_context = true,
  })
end

local tsautotag_ok, tsautotag = pcall(require, "nvim-ts-autotag")
if (tsautotag_ok) then
  tsautotag.setup({
    autotag = {
      enable = true,
    }
  })
end

-- keymappings - which_key
lvim.builtin.which_key.mappings["t"] = {
  name = "Toggles",
  _ = {
    name = "Settings",
    b = { "<cmd>IndentBlanklineToggle<cr>", "IndentBlanklineToggle" }
  },
  t = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm toggle<cr>", "ToggleTerm floating" },
    h = { "<cmd>ToggleTerm toggle direction=horizontal<cr>", "ToggleTerm horizontal" },
    v = { "<cmd>ToggleTerm toggle size=80 direction=vertical<cr>", "ToggleTerm vertical" }
  },
  d = {
    name = "Todo",
    q = { "<cmd>TodoQuickFix<cr>", "TodoQuickFix - list todos" },
    l = { "<cmd>TodoLocList<cr>", "TodoLocList - list todo locations" },
    t = { "<cmd>TodoTrouble<cr>", "TodoTrouble - view in trouble" },
    s = { "<cmd>TodoTelescope<cr>", "TodoQuickFix - telescope view" },
  },
  e = {
    name = "Explorer",
    g = { "g?", "g? -> show explorer commands" }
  },
  a = {
    name = "Diagnostics",
    a = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  }
}

lvim.builtin.alpha.dashboard.section.header.val = {
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⣠⣦⣄⣀⣴⣦⣄⣈⣻⣿⣿⣿⣿⣿⣿⡇ ',
  '⠀⠀⠀⠀⠀⠀⣀⡀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀',
  '⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠁⠀⠀⠀⠀⠀⠸⢿⣿⣷⣄⣀⠀⠀',
  '⠀⠀⠀⣶⣶⣿⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀',
  '⠀⣀⣠⣿⣿⣿⡿⠟⠁⠀⢀⣄⣀⣠⣦⣀⣠⣄⠀⢹⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀',
  '⠀⣿⣿⣿⣿⡿⠁⣰⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀',
  '⠀⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⠟⠛⠉⠉⠉⠉⠙⢻⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀',
  '⠀⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⠁⠀⠀⠹⠛⠁⠀⠀⠀',
  ' ⣿⣿⣿⣿⣿⣿⣿⣧⣤⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⠄⠀⠀⠀⠀⠀⠀⠀',
  '⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⡄⠀⠀⢀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀',
  '⠀⣿⣿⣿⣿⡿⠟⠛⠛⠛⠻⠿⣿⣿⣷⣤⣆⠀⣈⠻⣿⣿⣿⣿⣶⣶⣶⠆⠀⠀',
  '⠀⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠉⠉⠀⠀⠀',
  '⠀⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠹⢿⣿⣷⣄⣀⠀⠀⠀⠀',
  '⠀⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀'
}
