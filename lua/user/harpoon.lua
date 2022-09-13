local harpoon_ok, harpoon = pcall(require, "harpoon")
local telescope_ok, telescope = pcall(require, "telescope")

if (harpoon_ok) then
  harpoon.setup()

  if (telescope_ok) then
    telescope.load_extension("harpoon")
  end
end
