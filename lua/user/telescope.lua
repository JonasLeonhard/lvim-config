local telescope_ok = pcall(require, "telescope")
local liveGrep_ok = pcall(require, "telescope-live-grep-args.actions")
local harpoon_ok = pcall(require, "harpoon");

if (telescope_ok) then
  lvim.builtin.telescope.on_config_done = function(telescope)
    if (liveGrep_ok) then
      pcall(telescope.load_extension, "live_grep_args")
    end
    if (harpoon_ok) then
      pcall(telescope.load_extension, "harpoon");
    end
  end

  if (liveGrep_ok) then
    lvim.builtin.which_key.mappings["sg"] = { "<cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      "Grep with args" }
  end
end
