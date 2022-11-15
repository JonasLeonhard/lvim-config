local portal_ok, portal = pcall(require, "portal")
if not (portal_ok) then
  return
end

portal.setup({
  integrations = {
    harpoon = true
  },
  query = {
    "harpoon",
    "valid"
  }
});
