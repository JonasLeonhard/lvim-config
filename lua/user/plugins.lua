-- Additional Plugins
lvim.plugins = {
  -- Theme
  { "kaicataldo/material.vim" },
  -- Navigation
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      require("user.hop");
    end,
  },
  { "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" },
  -- In-Editor
  { "petertriho/nvim-scrollbar" },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup()
    end
  },
  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
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
  -- Git
  { "sindrets/diffview.nvim", requires = 'nvim-lua/plenary.nvim' },
  -- Syntax (non-lsp)
  { 'lumiliet/vim-twig' },
  { 'windwp/nvim-ts-autotag' },
  -- Debugging
  { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }, -- nvim-dap installed via lunarvim
  { "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text", requires = "mfussenegger/nvim-dap" },
}
