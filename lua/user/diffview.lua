local diffview_ok, diffview = pcall(require, "diffview")
if (diffview_ok) then
  diffview.setup({
    enhanced_diff_hl = true,
    keymaps = {
      view = { q = "<Cmd>DiffviewClose<CR>" },
      file_panel = { q = "<Cmd>DiffviewClose<CR>" },
      file_history_panel = { q = "<Cmd>DiffviewClose<CR>" },
      -- disable_defaults = true,
    },
    view = {
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = "diff3_mixed",
        disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
        winbar_info = true, -- See ':h diffview-config-view.x.winbar_info'
      },
    }
  })
end
