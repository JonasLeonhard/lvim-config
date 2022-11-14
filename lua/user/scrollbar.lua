local scrollbar_ok, scrollbar = pcall(require, "scrollbar")
local scrollbarGitsignIntegration_ok, scrollbarGitsignIntegration = pcall(require, "scrollbar.handlers.gitsigns")

if (scrollbar_ok) then
  if (scrollbarGitsignIntegration_ok) then
    scrollbarGitsignIntegration.setup()
  end
  scrollbar.setup()
end
