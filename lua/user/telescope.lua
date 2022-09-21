local telescope_ok, telescope = pcall(require, "telescope")
local liveGrep_ok = pcall(require, "telescope-live-grep-args.actions")

if (telescope_ok) then
  if (liveGrep_ok) then
    telescope.load_extension("live_grep_args")

    lvim.builtin.which_key.mappings["sg"] = { "<cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      "Grep with args" }
  end
end
