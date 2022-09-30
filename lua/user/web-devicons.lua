local ok, devicons = pcall(require, "nvim-web-devicons")

if not ok then
  return
end

-- TODO: this does not work for .njk files
devicons.set_icon = {
  njk = {
    icon = "📦",
    color = "#8FAA54",
    name = "njk",
  }
}
