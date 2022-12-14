local ok, devicons = pcall(require, "nvim-web-devicons")

if not ok then
  return
end

devicons.set_icon({
  njk = {
    icon = "",
    color = "#374c0b",
    name = "Nunjucks",
  },
  twig = {
    icon = "",
    color = "#8FAA54",
    name = "Twig",
  },
  applescript = {
    icon = "",
    color = "#ffffff",
    name = "Applescript",
  },
  cjs = {
    icon = "",
    color = "#e59c00",
    name = "CommonJs"
  },
  mod = {
    icon = "",
    color = "#e59c00",
    name = "GoModule"
  },
  sum = {
    icon = "",
    color = "#e59c00",
    name = "GoModule"
  }
})
