local harpoon_ok, harpoon = pcall(require, "harpoon");

if not harpoon_ok then
  return
end

local harpoonMark = require("harpoon.mark");

local harpoon_status = function()
  local status = harpoonMark.status()
  if status == '' then
    return '[U]'
  end

  return '[' .. status .. ']'
end

lvim.builtin.lualine.sections.lualine_a = { "mode", { function() return harpoon_status() end } };
