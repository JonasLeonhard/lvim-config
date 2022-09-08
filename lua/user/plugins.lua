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
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  -- In-Editor
  { "lukas-reineke/indent-blankline.nvim" },
  { "petertriho/nvim-scrollbar" },
  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- Syntax (non-lsp)
  { 'lumiliet/vim-twig' },
  { 'windwp/nvim-ts-autotag' },
  { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }, -- nvim-dap installed via lunarvim
  { "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" }
}
