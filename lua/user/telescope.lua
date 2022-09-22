local telescope_ok = pcall(require, "telescope")
local liveGrep_ok = pcall(require, "telescope-live-grep-args.actions")

if (telescope_ok) then
  if (liveGrep_ok) then
    lvim.builtin.telescope.extensions.live_grep_args = {
      theme_opts = {
        layout_strategy = "vertical" -- TODO: this does not work?!
      }
    }
    lvim.builtin.telescope.on_config_done = function(telescope)
      pcall(telescope.load_extension, "live_grep_args")
    end
    lvim.builtin.which_key.mappings["sg"] = { "<cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      "Grep with args" }
  end
end
