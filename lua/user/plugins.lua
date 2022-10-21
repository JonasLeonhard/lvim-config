-- Additional Plugins
lvim.plugins = {
  -- Theme
  { "catppuccin/nvim", as = "catppuccin" },
  -- Navigation
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("user.hop");
    end,
  },
  { "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" },
  -- Config
  { "gpanders/editorconfig.nvim" },
  -- In-Editor
  { "petertriho/nvim-scrollbar" },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup()
    end
  },
  { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim"
  },
  { "j-hui/fidget.nvim" },
  { "ray-x/lsp_signature.nvim" },
  -- Git
  { "sindrets/diffview.nvim", requires = 'nvim-lua/plenary.nvim' },
  -- Language Support
  { "Glench/Vim-Jinja2-Syntax" }, -- .njk
  { "nelsyeung/twig.vim" },
  { "windwp/nvim-ts-autotag" }, -- .tsx
  -- Debugging
  { "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text", requires = "mfussenegger/nvim-dap" },
}
