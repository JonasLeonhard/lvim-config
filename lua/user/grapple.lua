local grapple_ok, grapple = pcall(require, "grapple")
if not (grapple_ok) then
  return
end
grapple.setup();

lvim.builtin.lualine.sections.lualine_a = { "mode", "grapple" };
