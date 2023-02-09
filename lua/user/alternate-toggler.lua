local alternateToggler = require("alternate-toggler");

if not alternateToggler then
  return
end

alternateToggler.setup({
  alternates = {
    ["true"] = "false",
    ["True"] = "False",
    ["TRUE"] = "FALSE",
    ["Yes"] = "No",
    ["YES"] = "NO",
    ["UP"] = "DOWN",
    ["up"] = "down",
    ["DOWN"] = "UP",
    ["down"] = "up",
    ["LEFT"] = "RIGHT",
    ["left"] = "right",
    ["RIGHT"] = "LEFT",
    ["right"] = "left",
    ["TOP"] = "BOTTOM",
    ["top"] = "bottom",
    ["BOTTOM"] = "TOP",
    ["bottom"] = "top",
    ["1"] = "0",
    ["<"] = ">",
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ['"'] = "'",
    ['""'] = "''",
    ["+"] = "-",
    ["==="] = "!==",
    ["/"] = "\\",
    ["\\"] = "/",
    ["const"] = "let",
    ["let"] = "const",
    ["&&"] = "||",
    ["||"] = "&&",
    ["="] = ":",
    [":"] = "="
  }
})
