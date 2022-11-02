-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- custom keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- save
lvim.keys.normal_mode["<esc>"] = ":noh<cr>" -- clear ?: searches with esc
lvim.keys.normal_mode["<D-v>"] = "p" -- paste cmd-v
lvim.keys.normal_mode["<D-c>"] = "y" -- copy cmd-c

-- moving lines with shif-jk
lvim.keys.normal_mode["<C-k>"] = ":m .-2<CR>=="
lvim.keys.normal_mode["<C-j>"] = ":m .+1<CR>=="
lvim.keys.visual_block_mode["<C-j>"] = ":m '>+1<CR>gv-gv"
lvim.keys.visual_block_mode["<C-k>"] = ":m '<-2<CR>gv-gv"

--- ( portal ) jumplist
lvim.keys.normal_mode["<C-o>"] = ":lua require('portal').jump_backward()<CR>";
lvim.keys.normal_mode["<C-i>"] = ":lua require('portal').jump_forward()<CR>";

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
  name = " Portal",
  o = { "<cmd>:lua require('portal').jump_backward()<cr>", "Jump Backward <C-o>" },
  i = { "<cmd>:lua require('portal').jump_forward()<cr>", "Jump Forward <C-i>" },
  q = {
    name = " Query",
    o = {
      name = "<- backward",
      t = { "<cmd>:lua require('portal').jump_backward({ query = {'tagged'} })<cr>", "(Tagged) Jump Backward <C-o>" },
      m = { "<cmd>:lua require('portal').jump_backward({ query = {'modified'} })<cr>", "(Modified) Jump Backward <C-o>" },
      d = { "<cmd>:lua require('portal').jump_backward({ query = {'different'} })<cr>", "(Different) Jump Backward <C-o>" },
      v = { "<cmd>:lua require('portal').jump_backward({ query = {'valid'} })<cr>", "(Valid) Jump Backward <C-o>" },
    },
    i = {
      name = "-> forward",
      t = { "<cmd>:lua require('portal').jump_forward({ query = {'tagged'} })<cr>", "(Tagged) Jump Forward<C-i>" },
      m = { "<cmd>:lua require('portal').jump_forward({ query = {'modified'} })<cr>", "(Modified) Jump Forward<C-i>" },
      d = { "<cmd>:lua require('portal').jump_forward({ query = {'different'} })<cr>", "(Different) Jump Forward<C-i>" },
      v = { "<cmd>:lua require('portal').jump_forward({ query = {'valid'} })<cr>", "(Valid) Jump Forward<C-i>" },
    }
  },
  a = { "<cmd>:lua require('portal.tag').toggle()<cr>", "Add File Tag" },
  d = { "<cmd>:lua require('portal.tag').untag()<cr>", "Untag File Tag" },
  D = { "<cmd>:lua require('portal.tag').reset()<cr>", "Reset File Tags" },
}

lvim.builtin.which_key.mappings["R"] = {
  name = " Replace",
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
  p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
}

lvim.builtin.which_key.mappings["gD"] = {
  name = " Diffview",
  h = { "<cmd>DiffviewFileHistory %<cr>", "File History" },
  g = { "<cmd>DiffviewFileHistory<cr>", "Commit History global" },
  c = { "<cmd>DiffviewClose<cr>", "Diffview Close" }
}
