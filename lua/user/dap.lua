lvim.builtin.dap.active = true;

-- debugging (Setup)
local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, dapui = pcall(require, "dapui")
local telescope_ok, telescope = pcall(require, "telescope")

if (dap_ok) then
  if (dap_ui_ok) then
    dapui.setup();
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end

  if (telescope_ok) then
    telescope.load_extension("dap")
    lvim.builtin.which_key.mappings["de"] = {
      name = "Telescope-Dap",
      c = { "<cmd>:Telescope dap commands<cr>", "Commands" },
      C = { "<cmd>:Telescope dap configurations<cr>", "Configurations" },
      b = { "<cmd>:Telescope dap list_breakpoints<cr>", "Breakpoints" },
      v = { "<cmd>:Telescope dap variables<cr>", "Variables" },
      f = { "<cmd>:Telescope dap frames<cr>", "Frames" }
    }
  end
end
