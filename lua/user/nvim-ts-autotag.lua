local tsautotag_ok, tsautotag = pcall(require, "nvim-ts-autotag")
if (tsautotag_ok) then
  tsautotag.setup({
    autotag = {
      enable = true,
    }
  })
end
