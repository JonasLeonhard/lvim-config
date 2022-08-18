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
    -- required: 'npm i -g prettier' for your current nvm alias default NODE_VERSION to be set
    command = "prettier",
    extra_args = { "--print-with", "100" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- requires: 'npm i -g eslint_d' for your current nvm alias default NODE_VERSION to be set.
  { command = "eslint_d" },
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
  { "anuvyklack/pretty-fold.nvim" },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  -- Syntax (non-lsp)
  { 'lumiliet/vim-twig' },
}
-- Plugin Setups - TODO: why is config not working?
local scrollbar_ok, scrollbar = pcall(require, "scrollbar")
if (scrollbar_ok) then
  scrollbar.setup()
end

local prettyFold_ok, prettyFold = pcall(require, "pretty-fold")
if (prettyFold_ok) then
  prettyFold.setup({
    keep_indentation = false,
    fill_char = '━',
    sections = {
      left = {
        '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
      },
      right = {
        '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
      }
    }
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
}

lvim.builtin.which_key.vmappings["z"] = {
  name = "Fold",
  f = { "zf", "Create fold under selection (shift-v)" },
  d = { "zd", "Delete fold under selection (shift-v)" }
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
