local portal_ok, portal = pcall(require, "portal")
if not (portal_ok) then
  return
end

portal.setup();
lvim.builtin.lualine.sections.lualine_a = { "mode", "portal_status" };
