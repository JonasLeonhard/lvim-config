local portal_ok, portal = pcall(require, "portal")
if not (portal_ok) then
  return
end

portal.setup({ query = { "tagged", "valid" } });
