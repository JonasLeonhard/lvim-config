-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- custom keymapping
lvim.keys.normal_mode["<esc>"] = ":noh<cr>" -- clear ?: searches with esc
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- save
lvim.keys.normal_mode["<D-v>"] = "p" -- paste cmd-v
lvim.keys.normal_mode["<D-c>"] = "y" -- copy cmd-c

-- moving lines with shif-jk
lvim.keys.normal_mode["<C-k>"] = ":m .-2<CR>=="
lvim.keys.normal_mode["<C-j>"] = ":m .+1<CR>=="
lvim.keys.visual_block_mode["<C-j>"] = ":m '>+1<CR>gv-gv"
lvim.keys.visual_block_mode["<C-k>"] = ":m '<-2<CR>gv-gv"

-- keymappings (which_key)
lvim.builtin.which_key.mappings["t"] = {
  name = "  Toggles",
  _ = {
    name = "漣Settings",
    b = { "<cmd>IndentBlanklineToggle<cr>", "IndentBlanklineToggle" },
    F = { "<cmd>LvimToggleFormatOnSave<cr>", "Toggle Format_on_save" },
  },
  t = {
    name = " Terminal",
    f = { "<cmd>ToggleTerm toggle<cr>", "ToggleTerm floating" },
    h = { "<cmd>ToggleTerm toggle direction=horizontal<cr>", "ToggleTerm horizontal" },
    v = { "<cmd>ToggleTerm toggle size=80 direction=vertical<cr>", "ToggleTerm vertical" }
  },
  d = {
    name = " Todo",
    q = { "<cmd>TodoQuickFix<cr>", "TodoQuickFix - list todos" },
    l = { "<cmd>TodoLocList<cr>", "TodoLocList - list todo locations" },
    t = { "<cmd>TodoTrouble<cr>", "TodoTrouble - view in trouble" },
    s = { "<cmd>TodoTelescope<cr>", "TodoQuickFix - telescope view" },
  },
  e = {
    name = "פּ Explorer",
    g = { "g?", "g? -> show explorer commands" }
  },
  a = {
    name = " Diagnostics",
    a = { "<cmd>TroubleToggle document_diagnostics<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace diagnostics" },
    d = { "<cmd>TroubleToggle<cr>", "global diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  },
}

lvim.builtin.which_key.mappings["m"] = {
  name = "  Harpoon",
  l = { "<cmd>Telescope harpoon marks<cr>", "list Marks" },
  m = { "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", "Marks (builtin)" },
  a = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "Add File Mark" },
  d = { "<cmd>:lua require('harpoon.mark').toggle_file()<cr>", "Toggle File Mark" },
  g = {
    name = "GoTo",
    n = { "<cmd>:lua require('harpoon.ui').nav_next() <cr>", "Next Mark" },
    b = { "<cmd>:lua require('harpoon.ui').nav_prev()<cr>", "Prev Mark" },
    q = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Navigate(1)" },
    w = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Navigate(2)" },
    e = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Navigate(3)" },
    r = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Navigate(4)" },
    t = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Navigate(5)" },
  },
  t = {
    name = "Terminal",
    q = { "<cmd>:lua require('harpoon.term').gotoTerminal(1) <cr>", "GoToTerminal(1)" },
    w = { "<cmd>:lua require('harpoon.term').gotoTerminal(2) <cr>", "GoToTerminal(2)" },
    e = { "<cmd>:lua require('harpoon.term').gotoTerminal(3) <cr>", "GoToTerminal(3)" },
  },
  M = {
    name = "Marks",
    t = { "<cmd>MarksToggleSigns<cr>" },
    a = { "<cmd>MarksListAll<cr>", "List All" },
    b = { "<cmd>MarksListBuf<cr>", "List Buffer" },
    g = { "<cmd>MarksListGlobal<cr>", "List Global" },
    h = { "<cmd>:lua print('[mx] = set Mark <x>') print('[m,] = Set the next alphabetical lowercase mark') print('[dmx] = delete mark <x>') print('[dm-] = delete all marks on the current line') print('[dm<space>] = delete all marks in buffer') print('[m]] = move to next mark') print('[m[] = move to prev mark') print('[m:] = preview mark') print('[m0-9] = bookmark from bookmarkgroup') print('[dm0-9] = delete bookmark from bookmarkgroup') print('[m{] = move to next bookmark') print('[m}] = move to prev bookmark') print('[dm=] = delete bookmark under cursor')<cr>",
      "Keybind help" },
    d = { "<cmd>:delmarks a-zA-Z0-9<cr>", "Delete all marks globally" }
  }
}

lvim.builtin.which_key.mappings["R"] = {
  name = " Replace",
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
  p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
  w = { "<cmd>lua require('spectre').open({search_text=vim.fn.expand('<cword>'), path=vim.fn.expand('%')})<cr>",
    "Replace Word" },
}

lvim.builtin.which_key.mappings["gD"] = {
  name = " Diffview",
  h = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
  g = { "<cmd>DiffviewFileHistory<cr>", "Commit History global" },
  c = { "<cmd>DiffviewClose<cr>", "Diffview Close" }
}

lvim.builtin.which_key.setup.plugins.marks = true;
