-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- custom keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- save
lvim.keys.normal_mode["<esc>"] = ":noh<cr>" -- clear ?: searches with esc
lvim.keys.normal_mode["<D-v>"] = "p" -- paste cmd-v
lvim.keys.normal_mode["<D-c>"] = "y" -- copy cmd-c

-- keymappings (which_key)
lvim.builtin.which_key.mappings["t"] = {
  name = "Toggles",
  _ = {
    name = "Settings",
    b = { "<cmd>IndentBlanklineToggle<cr>", "IndentBlanklineToggle" },
    F = { "<cmd>:lua lvim.format_on_save = not lvim.format_on_save<CR>", "Toggle Format_on_save" },
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
