-- Additional Plugins
lvim.plugins = {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin" },
  -- Navigation
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("user.hop");
    end,
  },
  { "ThePrimeagen/harpoon", dependencies = "nvim-lua/plenary.nvim" },
  { "chentoast/marks.nvim" },
  -- Config
  -- { "gpanders/editorconfig.nvim" },
  { "tpope/vim-sleuth" }, -- guess indentation, takes editorconfig into consideration
  -- In-Editor
  { "lewis6991/gitsigns.nvim" },
  { "petertriho/nvim-scrollbar", dependencies = { "lewis6991/gitsigns.nvim" } },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("user.neoscroll");
    end
  },
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
  { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
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
  { "nvim-pack/nvim-spectre" },
  { "tpope/vim-surround" },
  { "rmagatti/alternate-toggler" },
  -- Git
  { "sindrets/diffview.nvim", dependencies = 'nvim-lua/plenary.nvim' },
  -- Language Support
  { "Glench/Vim-Jinja2-Syntax" }, -- .njk
  { "nelsyeung/twig.vim" },
  { "windwp/nvim-ts-autotag" }, -- .tsx
  -- Debugging
  { "nvim-telescope/telescope-dap.nvim", dependencies = "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text", dependencies = "mfussenegger/nvim-dap" },
}
