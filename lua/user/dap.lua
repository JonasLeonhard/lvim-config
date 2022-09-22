lvim.builtin.dap.active = true;

-- debugging (Setup)
local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, dapui = pcall(require, "dapui")
local dap_virtual_text_ok, dapVirtualText = pcall(require, "nvim-dap-virtual-text")
local telescope_ok, telescope = pcall(require, "telescope")
local masonPath = require("mason-core.path")

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

  if (dap_virtual_text_ok) then
    dapVirtualText.setup()
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

  -- debugging (Language specific Adapters & Configurations) - introduction see :help dap.txt
  -- installation infos can be found at: https://github-wiki-see.page/m/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

  -- INFO: Firefox
  -- docs: https://github.com/firefox-devtools/vscode-firefox-debug
  -- 1. have remote debugging enabled in console-><F1>settings->enable remote debugging
  -- 2. request = launch-> launches firefox window on port, request = attach: start firefox /Applications/Firefox.app/Contents/MacOS/firefox -start-debugger-server, and remotely controls firefox
  dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { masonPath.package_prefix('firefox-debug-adapter') .. '/dist/adapter.bundle.js' },
  }
  local dapFirefox = {
    name = 'Debug with Firefox (launch)',
    type = 'firefox',
    request = 'launch',
    reAttach = true,
    url = 'http://localhost:3000', -- change this port/url to your running app
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox-bin'
  }
  local dapFirefoxAttach = {
    name = 'Debug with Firefox (Attach -> requires /Applications/Firefox.app/Contents/MacOS/firefox -start-debugger-server)',
    type = 'firefox',
    request = 'attach',
    reAttach = true,
    url = 'http://localhost:3000', -- change this port/url to your running app
    webRoot = '${workspaceFolder}',
    firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox-bin'
  }

  -- INFO: NODE
  -- doc: https://github.com/microsoft/vscode-node-debug2
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { masonPath.package_prefix('node-debug2-adapter') .. '/out/src/nodeDebug.js' },
  }
  local dapNode = {
    name = 'Debug with Node2 (launch)',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  }
  -- For this to work you need to make sure the node process is started with the `--inspect-brk` flag.
  local dapNodeAttach = {
    name = 'Debug with Node2 (Attach -> requires node started with --inspect-brk flag)',
    type = 'node2',
    request = 'attach',
    cwd = "${workspaceFolder}",
    processId = require 'dap.utils'.pick_process,
  }

  -- INFO: PHP
  -- doc: https://github.com/xdebug/vscode-php-debug#supported-launchjson-settings
  -- requires sudo pecl install xdebug / or xdebug listening on port 9003 in a container/remote environment
  -- test a local file with php -S localhost:8080 -t ./
  -- make sure php --ini contains [xdebug] conf:
  -- xdebug.mode = debug
  -- xdebug.client_host = 127.0.0.1
  -- xdebug.client_port = 9003
  -- xdebug.start_with_request=yes
  -- xdebug.log="/var/log/nginx/xdebug.log"
  -- xdebug.discover_client_host=false
  dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { masonPath.package_prefix('php-debug-adapter') .. '/out/phpDebug.js' }
  }
  local dapPhp =
  {
    name = 'Debug with Xdebug (local)',
    type = 'php',
    request = 'launch',
    port = 9003, -- port to connect to xdebug
  }

  local dapPhpRemote =
  {
    name = 'Debug with Xdebug (remote with server->local pathMappings)',
    type = 'php',
    request = 'launch',
    port = 9003, -- port to connect to xdebug
    -- server -> local mappings
    pathMappings = {
      { "/var/www/html", "${workspaceFolder}/www" },
      { "/app", "${workspaceFolder}/app" }
    }
  }

  -- Set Configurations
  dap.configurations.typescript = { dapFirefox, dapFirefoxAttach, dapNode, dapNodeAttach }
  dap.configurations.typescriptreact = { dapFirefox, dapFirefoxAttach, dapNode, dapNodeAttach }
  dap.configurations.javascriptreact = { dapFirefox, dapFirefoxAttach, dapNode, dapNodeAttach }
  dap.configurations.javascript = { dapFirefox, dapFirefoxAttach, dapNode, dapNodeAttach }
  dap.configurations.php = { dapPhp, dapPhpRemote }
end